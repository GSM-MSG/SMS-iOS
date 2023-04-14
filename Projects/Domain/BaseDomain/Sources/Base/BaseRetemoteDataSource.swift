import DateUtil
import Emdpoint
import Foundation
import JwtStoreInterface

open class BaseRetemoteDataSource<Endpoint: SMSEndpoint> {
    private let jwtStore: any JwtStore
    private let client: EmdpointClient<Endpoint>
    private let decoder = JSONDecoder()
    private let maxRetryCount = 2

    public init(
        jwtStore: any JwtStore,
        client: EmdpointClient<Endpoint>? = nil
    ) {
        self.jwtStore = jwtStore

        #if DEV
        self.client = client ?? .init(interceptors: [JwtInterceptor(jwtStore: jwtStore)])
        #else
        self.client = client ?? .init(interceptors: [JwtInterceptor(jwtStore: jwtStore)])
        #endif
    }

    @discardableResult
    public func request<T: Decodable>(_ endpoint: Endpoint, dto: T.Type) async throws -> T {
        let res = try await checkIsEndpointNeedsAuth(endpoint)
        ? authorizedRequest(endpoint)
        : defaultRequest(endpoint)
        return try decoder.decode(dto, from: res.data)
    }

    public func request(_ endpoint: Endpoint) async throws {
        _ = try await checkIsEndpointNeedsAuth(endpoint)
        ? authorizedRequest(endpoint)
        : defaultRequest(endpoint)
    }
}

private extension BaseRetemoteDataSource {
    func defaultRequest(_ endpoint: Endpoint) async throws -> DataResponse {
        try await Task.retrying(maxRetryCount: maxRetryCount) {
            try await self.performRequest(endpoint)
        }
        .value
    }

    func authorizedRequest(_ endpoint: Endpoint) async throws -> DataResponse {
        for _ in 0..<maxRetryCount {
            do {
                try _Concurrency.Task<Never, Never>.checkCancellation()
                return try await performRequest(endpoint)
            } catch {
                if checkTokenIsExpired() { try await tokenRefresh() }
                continue
            }
        }
        try _Concurrency.Task<Never, Never>.checkCancellation()
        return try await performRequest(endpoint)
    }

    func performRequest(_ endpoint: Endpoint) async throws -> DataResponse {
        try await client.request(endpoint)
    }

    func checkIsEndpointNeedsAuth(_ endpoint: Endpoint) -> Bool {
        endpoint.jwtTokenType == .accessToken
    }

    func checkTokenIsExpired() -> Bool {
        let expired = jwtStore.load(property: .accessExpiresAt).toISODate()
        return Date() > expired
    }

    func tokenRefresh() async throws {
        return
    }
}

private extension Task where Failure == Error {
    @discardableResult
    static func retrying(
        priority: TaskPriority? = nil,
        maxRetryCount: Int = 3,
        retryDelay: TimeInterval = 0.5,
        operation: @Sendable @escaping () async throws -> Success
    ) -> Task {
        Task(priority: priority) {
            for _ in 0..<maxRetryCount {
                do {
                    return try await operation()
                } catch {
                    let oneSecond = TimeInterval(1_000_000_000)
                    let delay = UInt64(oneSecond * retryDelay)
                    try await Task<Never, Never>.sleep(nanoseconds: delay)
                    
                    continue
                }
            }

            try Task<Never, Never>.checkCancellation()
            return try await operation()
        }
    }
}
