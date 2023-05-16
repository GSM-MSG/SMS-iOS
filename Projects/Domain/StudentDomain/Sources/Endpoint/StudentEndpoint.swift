import BaseDomain
import Emdpoint
import StudentDomainInterface

enum StudentEndpoint {
    case inputInformation(StudentRequestDTO)
}

extension StudentEndpoint: SMSEndpoint {
    typealias ErrorType = StudentDomainError

    var route: Route {
        switch self {
        case .inputInformation:
            return .post("/student")
        }
    }

    var task: HTTPTask {
        switch self {
        case let .inputInformation(req):
            return .requestParameters(body: [
                "major": req.major,
                "techStack": req.techStack,
                "profileImgUrl": req.profileImgUrl,
                "introduce": req.introduce,
                "stuNum": req.stuNum,
                "portfolioUrl": req.portfolioUrl,
                "contactEmail": req.contactEmail,
                "gsmAuthenticationScore": req.gsmAuthenticationScore,
                "salary": req.salary,
                "region": req.region,
                "languageCertificate": req.languageCertificate,
                "dreamBookFileUrl": req.dreamBookFileUrl,
                "militaryService": req.militaryService,
                "certificate": req.certificate
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
                500: .internalServerError
            ]
        }
    }
}
