import Emdpoint
import Foundation
import JwtStoreInterface

public struct JwtInterceptor: InterceptorType {
    private let jwtStore: any JwtStore

    public init(jwtStore: any JwtStore) {
        self.jwtStore = jwtStore
    }

    public func prepare(
        _ request: URLRequest,
        endpoint: EndpointType,
        completion: (Result<URLRequest, EmdpointError>) -> Void
    ) {
        guard let jwtType = (endpoint as? JwtAuthorizable)?.jwtTokenType,
              jwtType != .none
        else {
            completion(.success(request))
            return
        }
        var newRequest = request
        let token = getToken(type: jwtType.toJwtStoreProperty)

        newRequest.addValue(token, forHTTPHeaderField: jwtType.rawValue)
        completion(.success(newRequest))
    }
}

private extension JwtInterceptor {
    func getToken(type: JwtStoreProperty) -> String {
        jwtStore.load(property: type)
    }

    func saveToken(tokenDTO: JwtTokenDTO) {
        jwtStore.save(property: .accessToken, value: tokenDTO.accessToken)
        jwtStore.save(property: .refreshToken, value: tokenDTO.refreshToken)
        jwtStore.save(property: .accessExpiresAt, value: tokenDTO.accessExpiresAt)
        jwtStore.save(property: .refreshExpiresAt, value: tokenDTO.refreshExpiresAt)
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
