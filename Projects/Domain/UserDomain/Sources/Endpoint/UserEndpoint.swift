import BaseDomain
import Emdpoint
import UserDomainInterface

enum UserEndpoint {
    case fetchMyMiniProfile
    case fetchMyProfile
}

extension UserEndpoint: SMSEndpoint {
    typealias ErrorType = UserDomainError

    var domain: SMSDomain {
        .user
    }

    var route: Route {
        switch self {
        case .fetchMyMiniProfile:
            return .get("/profile/img")

        case .fetchMyProfile:
            return .get("/profile")
        }
    }

    var task: HTTPTask {
        switch self {
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
        case .fetchMyMiniProfile, .fetchMyProfile:
            return [:]
        }
    }
}
