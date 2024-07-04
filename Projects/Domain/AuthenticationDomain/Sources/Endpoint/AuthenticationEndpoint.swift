import AuthenticationDomainInterface
import BaseDomain
import Emdpoint

enum AuthenticationEndpoint {
    case fetchAuthenticationForm
    case inputAuthentication(req: InputAuthenticationRequestDTO)
}

extension AuthenticationEndpoint: SMSEndpoint {
    typealias ErrorType = AuthenticationDomainError

    var domain: SMSDomain {
        .authentication
    }

    var route: Route {
        switch self {
        case .fetchAuthenticationForm:
            return .get("/form")
        case .inputAuthentication:
            return .post("/submit")
        }
    }

    var task: HTTPTask {
        switch self {
        case .fetchAuthenticationForm:
            return .requestPlain

        case let .inputAuthentication(req):
            return .requestJSONEncodable(req)

        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchAuthenticationForm:
            return .accessToken

        case .inputAuthentication:
            return .accessToken

        default:
            return .none
        }
    }

    var errorMap: [Int: ErrorType]? {
        switch self {
        case .fetchAuthenticationForm:
            return [
                500: .internalServerError
            ]
        case .inputAuthentication:
            return [
                500: .internalServerError
            ]
        }
    }
}
