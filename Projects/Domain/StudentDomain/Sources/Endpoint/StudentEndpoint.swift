import BaseDomain
import Emdpoint
import StudentDomainInterface

enum StudentEndpoint {
    case inputInformation(InputStudentInformationRequestDTO)
    case fetchStudentList(FetchStudentListRequestDTO)
    case fetchStudentDetailByStudent(userID: String)
}

extension StudentEndpoint: SMSEndpoint {
    typealias ErrorType = StudentDomainError

    var domain: SMSDomain {
        .student
    }

    var route: Route {
        switch self {
        case .inputInformation:
            return .post("")

        case .fetchStudentList:
            return .get("")

        case let .fetchStudentDetailByStudent(userID):
            return .get("/\(userID)")
        }
    }

    var task: HTTPTask {
        switch self {
        case let .inputInformation(req):
            return .requestJSONEncodable(req)

        case let .fetchStudentList(request):
            return .requestParameters(query: [
                "page": request.page,
                "size": request.size
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

    var errorMap: [Int: ErrorType]? {
        switch self {
        case .inputInformation:
            return [
                400: .invalidRequest,
                409: .alreadyExistUser
            ]
        
        case .fetchStudentList:
            return [
                400: .invalidRequest
            ]

        case .fetchStudentDetailByStudent:
            return [:]
        }
    }
}
