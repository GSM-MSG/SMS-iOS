import Foundation

public enum StudentDomainError: Error {
    case invalidRequest
    case alreadyByUser
}

extension StudentDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return "Request 요청 값 다름"

        case .alreadyByUser:
            return "유저가 이미 존재함"
        }
    }
}
