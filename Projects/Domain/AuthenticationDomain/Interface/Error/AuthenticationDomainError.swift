import Foundation

public enum AuthenticationDomainError: Error {
    case internalServerError
}

extension AuthenticationDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .internalServerError:
            return "서버에서 문제가 발생하였습니다. 지속될 시 문의해주세요."
        }
    }
}
