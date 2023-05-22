import FileDomainInterface
import Foundation
import Emdpoint
import BaseDomain

enum FileEndpoint {
    case dreamBookUpload(file: Data, fileName: String)
}

extension FileEndpoint: SMSEndpoint {
    typealias ErrorType = FileDomainError

    var route: Route {
        switch self {
        case .dreamBookUpload:
            return .post("/")
        }
    }

    var task: HTTPTask {
        switch self {
        case let .dreamBookUpload(file, fileName):
            return .uploadMultipart([
                MultiPartFormData(field: "file", data: file, fileName: fileName)
            ])

        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        case .dreamBookUpload:
            return .accessToken

        default:
            return .none
        }
    }

    var errorMap: [Int: ErrorType]? {
        switch self {
        case .dreamBookUpload:
            return [
                400: .notHwpFile,
                500: .internalServerError
            ]
        }
    }
}
