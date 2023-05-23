import MajorDomainInterface
import BaseDomain
import Emdpoint

enum MajorEndpoint {
    case fetchMajorList
}

extension MajorEndpoint: SMSEndpoint {
    typealias ErrorType = MajorDomainError

    var domain: SMSDomain {
        .major
    }

    var route: Route {
        switch self {
        case .fetchMajorList:
            return .post("list")
        }
    }

    var task: HTTPTask {
        switch self {
        case .fetchMajorList:
            return .requestPlain

        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchMajorList:
            return .accessToken

        default:
            return .none
        }
    }

    var errorMap: [Int: ErrorType]? {
        switch self {
        case .fetchMajorList:
            return [
                500: .internalServerError
            ]
        }
    }
}
