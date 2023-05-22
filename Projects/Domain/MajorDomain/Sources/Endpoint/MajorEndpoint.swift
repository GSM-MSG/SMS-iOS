import MajorDomainInterface
import BaseDomain
import Emdpoint

enum MajorEndpoint {
    case fetchList
}

extension MajorEndpoint: SMSEndpoint {
    typealias ErrorType = MajorDomainError

    var route: Route {
        switch self {
        case .fetchList:
            return .post("/list")
        }
    }

    var task: HTTPTask {
        switch self {
        case .fetchList:
            return .requestPlain

        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchList:
            return .accessToken

        default:
            return .none
        }
    }

    var errorMap: [Int: ErrorType]? {
        switch self {
        case .fetchList:
            return [
                500: .internalServerError
            ]
        }
    }
}
