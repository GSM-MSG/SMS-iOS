import Emdpoint
import Foundation

enum RefreshEndpoint: SMSEndpoint {
    case refresh
}

extension RefreshEndpoint {
    var route: Route {
        return .patch("auth")
    }

    var task: HTTPTask {
        return .requestPlain
    }

    var jwtTokenType: JwtTokenType {
        return .refreshToken
    }

    typealias ErrorType = Error
    var errorMap: [Int: ErrorType]? {
        return nil
    }
}
