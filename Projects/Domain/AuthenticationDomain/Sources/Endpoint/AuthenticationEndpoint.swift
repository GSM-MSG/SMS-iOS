import AuthenticationDomainInterface
import BaseDomain
import Emdpoint

enum AuthenticationEndpoint {
    case fetchAuthenticationForm(uuid: String)
    case inputAuthentication(uuid: String, req: InputAuthenticationRequestDTO)
}

extension AuthenticationEndpoint: SMSEndpoint {
    typealias ErrorType = AuthenticationDomainError

    var domain: SMSDomain {
        .authentication
    }

    var route: Route {
        switch self {
        case let .fetchAuthenticationForm(uuid):
            return .get("/form/\(uuid)")
        case let .inputAuthentication(uuid, _):
            return .post("/submit/\(uuid)")
        }
    }

    var task: HTTPTask {
        switch self {
        case .fetchAuthenticationForm:
            return .requestPlain

        case let .inputAuthentication(_, req):
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
