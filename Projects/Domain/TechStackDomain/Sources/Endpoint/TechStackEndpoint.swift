import BaseDomain
import Emdpoint
import TechStackDomainInterface

enum TechStackEndpoint {
    case fetchTechStackList(keyword: String)
}

extension TechStackEndpoint: SMSEndpoint {
    typealias ErrorType = TechStackError

    var domain: SMSDomain {
        .techStack
    }

    var route: Route {
        switch self {
        case .fetchTechStackList:
            return .get("/list")
        }
    }

    var task: HTTPTask {
        switch self {
        case let .fetchTechStackList(keyword):
            return .requestParameters(query: [
                "name": keyword
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
        case .fetchTechStackList:
            return [
                400: .invalidRequest
            ]
        }
    }
}
