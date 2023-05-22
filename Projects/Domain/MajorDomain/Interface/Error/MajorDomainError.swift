import Foundation

public enum MajorDomainError: Error {
    case internalServerError
}

extension MajorDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .internalServerError:
            return "서버에서 문제가 발생하였습니다. 지속될 시 문의해주세요."
        }
    }
}
