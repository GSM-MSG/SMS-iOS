import Foundation

public enum FileDomainError: Error {
    case notImageType
    case notFileType
    case internalServerError
}

extension FileDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notImageType:
            return "이미지 형식이 jpg, jpeg, png, heic인 이미지가 아닙니다."

        case .notFileType:
            return "파일 형식이 hw, hwpx, png인 파일이 아닙니다."

        case .internalServerError:
            return "서버에서 문제가 발생하였습니다. 지속될 시 문의해주세요."
        }
    }
}
