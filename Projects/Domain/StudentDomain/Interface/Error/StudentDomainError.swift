import Foundation

public enum StudentDomainError: Error {
    case invalidGAuthCode
    case internalServerError
}

extension StudentDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidGAuthCode:
            return "Request 요청 값 다름"

        case .internalServerError:
            return "이미 존재함"
        }
    }
}
