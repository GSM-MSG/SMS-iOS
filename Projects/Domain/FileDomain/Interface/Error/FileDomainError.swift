import Foundation

public enum FileDomainError: Error {
    case notHwpFile
    case internalServerError
}

extension FileDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notHwpFile:
            return "hwp 파일이 아니거나 hwpx 파일이 아닙니다."

        case .internalServerError:
            return "서버에서 문제가 발생하였습니다. 지속될 시 문의해주세요."
        }
    }
}
