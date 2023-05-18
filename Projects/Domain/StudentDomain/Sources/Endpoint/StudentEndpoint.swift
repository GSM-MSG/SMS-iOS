import BaseDomain
import Emdpoint
import StudentDomainInterface

enum StudentEndpoint {
    case inputInformation(StudentRequestDTO)
}

extension StudentEndpoint: SMSEndpoint {
    typealias ErrorType = StudentDomainError

    var route: Route {
        switch self {
        case .inputInformation:
            return .post("/student")
        }
    }

    var task: HTTPTask {
        switch self {
        case let .inputInformation(req):
            return .requestJSONEncodable(req)

        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .accessToken
        }
    }

    var errorMap: [Int: ErrorType]? {
        switch self {
        case .inputInformation:
            return [
                400: .invalidRequest,
                409: .alreadyByUser
            ]
        }
    }
}
