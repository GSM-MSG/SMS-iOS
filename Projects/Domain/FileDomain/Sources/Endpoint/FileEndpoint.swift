import BaseDomain
import Emdpoint
import FileDomainInterface
import Foundation

enum FileEndpoint {
    case imageUpload(image: Data, fileName: String)
    case fileUpload(file: Data, fileName: String)
}

extension FileEndpoint: SMSEndpoint {
    typealias ErrorType = FileDomainError

    var domain: SMSDomain {
        .file
    }

    var route: Route {
        switch self {
        case .imageUpload:
            return .post("/image")

        case .fileUpload:
            return .post("")
        }
    }

    var task: HTTPTask {
        switch self {
        case let .imageUpload(image, fileName):
            return .uploadMultipart([
                MultiPartFormData(field: "file", data: image, fileName: fileName)
            ])

        case let .fileUpload(file, fileName):
            return .uploadMultipart([
                MultiPartFormData(field: "file", data: file, fileName: fileName)
            ])

        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        case .imageUpload:
            return .accessToken

        case .fileUpload:
            return .accessToken

        default:
            return .none
        }
    }

    var headers: [String: String]? {
        nil
    }

    var errorMap: [Int: ErrorType]? {
        switch self {
        case .imageUpload:
            return [
                400: .notImageType,
                500: .internalServerError
            ]
        case .fileUpload:
            return [
                400: .notFileType,
                500: .internalServerError
            ]
        }
    }
}
