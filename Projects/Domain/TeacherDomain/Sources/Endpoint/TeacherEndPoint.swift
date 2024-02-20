import BaseDomain
import Emdpoint

enum TeacherEndPoint {
    case common
    case principal
    case deputyPrincipal
    case director
    case homeroom(grade: Int, classNum: Int)
}

extension TeacherEndPoint: SMSEndpoint {
    typealias ErrorType = TeacherDomainError
    
    var domain: SMSDomain {
        .teacher
    }
    
    var route: Route {
        switch self {
        case .common:
            return .post("/common")
            
        case .principal:
            return .post("/principal")
            
        case .deputyPrincipal:
            return .post("/deputy-principal")
            
        case .director:
            return .post("/director")
            
        case .homeroom:
            return .post("/homeroom")
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .homeroom(let grade, let classNum):
            return .requestParameters(body: [
                "grade": grade,
                "classNum": classNum
            ])
            
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
    
    var errorMap: [Int : ErrorType]? {
        switch self {
        default:
            return [
                400: .invalidRequest,
                403: .invalidRequest,
                409: .alreadyExistUser
            ]
        }
    }
}
