import Emdpoint
import Foundation
import JwtStoreInterface

public struct JwtInterceptor: InterceptorType {
    private let jwtStore: any JwtStore

    public init(jwtStore: any JwtStore) {
        self.jwtStore = jwtStore
    }

    public func willRequest(_ request: URLRequest, endpoint: EndpointType) {
        HTTPCookieStorage.shared.cookies?
            .forEach(HTTPCookieStorage.shared.deleteCookie(_:))
    }

    public func prepare(
        _ request: URLRequest,
        endpoint: EndpointType,
        completion: @escaping (Result<URLRequest, EmdpointError>) -> Void
    ) {
        guard let jwtType = (endpoint as? JwtAuthorizable)?.jwtTokenType,
              jwtType != .none
        else {
            completion(.success(request))
            return
        }
        var newRequest = request
        newRequest.httpShouldHandleCookies = false
        let token = getToken(type: jwtType.toJwtStoreProperty)
        guard !token.isEmpty else {
            completion(.success(newRequest))
            return
        }

        newRequest.setValue(jwtType == .accessToken ? "Bearer \(token)" : token, forHTTPHeaderField: jwtType.rawValue)
        if checkTokenIsExpired() {
            reissueToken(newRequest, jwtType: jwtType, completion: completion)
        } else {
            completion(.success(newRequest))
        }
    }

    public func didReceive(_ result: Result<DataResponse, EmdpointError>, endpoint: EndpointType) {
        switch result {
        case let .success(res):
            if let tokenDTO = try? JSONDecoder().decode(JwtTokenDTO.self, from: res.data) {
                saveToken(tokenDTO: tokenDTO)
            }

        default:
            break
        }
    }
}

private extension JwtInterceptor {
    func getToken(type: JwtStoreProperty) -> String {
        switch type {
        case .accessToken:
            return jwtStore.load(property: type)

        default:
            return jwtStore.load(property: type)
        }
    }

    func saveToken(tokenDTO: JwtTokenDTO) {
        jwtStore.save(property: .accessToken, value: tokenDTO.accessToken)
        jwtStore.save(property: .refreshToken, value: tokenDTO.refreshToken)
        jwtStore.save(property: .accessExpiresAt, value: tokenDTO.accessExpiresAt)
        jwtStore.save(property: .refreshExpiresAt, value: tokenDTO.refreshExpiresAt)
    }

    func checkTokenIsExpired() -> Bool {
        let expired = jwtStore.load(property: .accessExpiresAt)
            .toDateCustomFormat(format: "yyyy-MM-dd'T'HH:mm:ss")
        return Date() > expired
    }

    func reissueToken(
        _ request: URLRequest,
        jwtType: JwtTokenType,
        completion: @escaping (Result<URLRequest, EmdpointError>) -> Void
    ) {
#if DEV || STAGE
        let client = EmdpointClient<RefreshEndpoint>(interceptors: [SMSLoggingInterceptor()])
#else
        let client = EmdpointClient<RefreshEndpoint>()
#endif
        let refreshToken = jwtStore.load(property: .refreshToken)
        client.request(.refresh(refreshToken: refreshToken)) { result in
            switch result {
            case let .success(response):
                var request = request
                if let tokenDTO = try? JSONDecoder().decode(JwtTokenDTO.self, from: response.data) {
                    saveToken(tokenDTO: tokenDTO)
                    let isAccess = jwtType == .accessToken
                    let token = getToken(type: jwtType.toJwtStoreProperty)
                    request.setValue(
                        isAccess ? "Bearer \(token)" : token,
                        forHTTPHeaderField: jwtType.rawValue
                    )
                }
                completion(.success(request))

            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

private extension JwtTokenType {
    var toJwtStoreProperty: JwtStoreProperty {
        switch self {
        case .accessToken:
            return .accessToken

        case .refreshToken:
            return .refreshToken

        case .none:
            return .accessToken
        }
    }
}
