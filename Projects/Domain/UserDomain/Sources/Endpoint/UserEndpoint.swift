import BaseDomain
import Emdpoint

enum UserEndpoint {
    case fetchMyMiniProfile
}

extension UserEndpoint: SMSEndpoint {
    typealias ErrorType = UserDomainError

    var domain: SMSDomain {
        .user
    }

    var route: Route {
        switch self {
        case .fetchMyMiniProfile:
            return .get("/profile")
        }
    }

    var task: HTTPTask {
        switch self {
        case .fetchMyMiniProfile:
            return .requestPlain

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
        case .fetchMyMiniProfile:
            return [:]
        }
    }
}
