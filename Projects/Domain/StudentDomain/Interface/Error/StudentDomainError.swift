import Foundation

public enum StudentDomainError: Error {
    case invalidRequest
    case alreadyByUser
}

extension StudentDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return "알 수 없는 에러가 발생하였습니다."

        case .alreadyByUser:
            return "이미 존재하는 유저입니다."
        }
    }
}
