import AuthDomainInterface
import BaseDomain
import Emdpoint

enum AuthEndpoint {
    case signin(code: String)
    case logout
}

extension AuthEndpoint: SMSEndpoint {
    typealias ErrorType = AuthDomainError

    var domain: SMSDomain {
        .auth
    }

    var route: Route {
        switch self {
        case .signin:
            return .post("")
        case .logout:
            return .delete("")
        }
    }

    var task: HTTPTask {
        switch self {
        case let .signin(code):
            return .requestParameters(body: [
                "code": code
            ])

        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .none
        }
    }

    var errorMap: [Int: ErrorType]? {
        switch self {
        case .signin:
            return [
                400: .failedToGAuthSignin,
                401: .failedToGAuthSignin,
                404: .failedToGAuthSignin,
                500: .internalServerError
            ]
        case .logout:
            return [
                404: .internalServerError
            ]
        }
    }
}
