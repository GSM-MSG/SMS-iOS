import BaseDomain
import Emdpoint
import StudentDomainInterface

enum StudentEndpoint {
    case inputInformation(InputStudentInformationRequestDTO)
    case fetchStudentList(FetchStudentListRequestDTO)
    case fetchStudentDetailByStudent(userID: String)
    case fetchStudentDetailByGuest(userID: String)
    case fetchStudentDetailByTeacher(userID: String)
    case modifyInformation(ModifyStudentInformationRequestDTO)
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

        case let .fetchStudentDetailByGuest(userID):
            return .get("/anonymous/\(userID)")

        case let .fetchStudentDetailByTeacher(userID):
            return .get("/teacher/\(userID)")

        case .modifyInformation:
            return .put("")
        }
    }

    // swiftlint: disable syntactic_sugar
    var task: HTTPTask {
        switch self {
        case let .inputInformation(req):
            return .requestJSONEncodable(req)

        case let .fetchStudentList(request):
            let mirror = Mirror(reflecting: request)
            let requestQuery = mirror.children
                .lazy
                .compactMap { (label: String?, value: Any) -> (String, Any)? in
                    guard let label = label,
                          case Optional<Any>.some = value,
                          let optionalValue = value as? Any?,
                          let unwrapedValue = optionalValue
                    else { return nil }

                    if value is (any RawRepresentable),
                       let rawValue = (value as? (any RawRepresentable))?.rawValue {
                        return (label, "\(rawValue)")
                    }
                    return (
                        label,
                        "\(unwrapedValue)"
                            .replacingOccurrences(of: "[", with: "")
                            .replacingOccurrences(of: "]", with: "")
                            .replacingOccurrences(of: "\"", with: "")
                    )
                }
            let requestDictionary = Dictionary(uniqueKeysWithValues: requestQuery)
            return .requestParameters(query: requestDictionary)

        default:
            return .requestPlain
        }
    }
    // swiftlint: enable syntactic_sugar

    var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchStudentDetailByGuest:
            return .none

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

        case .fetchStudentDetailByGuest:
            return [:]

        case .fetchStudentDetailByTeacher:
            return [:]

        case .modifyInformation:
            return [
                400: .invalidRequest
            ]
        }
    }
}
