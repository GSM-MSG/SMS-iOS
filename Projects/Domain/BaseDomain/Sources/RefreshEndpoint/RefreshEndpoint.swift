import Emdpoint
import Foundation

enum RefreshEndpoint: SMSEndpoint {
    case refresh(refreshToken: String)
}

extension RefreshEndpoint {
    var domain: SMSDomain {
        .auth
    }

    var route: Route {
        return .patch("")
    }

    var task: HTTPTask {
        return .requestPlain
    }

    var jwtTokenType: JwtTokenType {
        return .none
    }

    var headers: [String: String]? {
        switch self {
        case let .refresh(refreshToken):
            return [
                "Refresh-Token": refreshToken
            ]
        }
    }

    typealias ErrorType = Error
    var errorMap: [Int: ErrorType]? {
        return nil
    }
}
