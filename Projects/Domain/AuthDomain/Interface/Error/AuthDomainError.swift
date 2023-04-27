import Foundation

public enum AuthDomainError: Error {
    case invalidGAuthCode
    case internalServerError
}

extension AuthDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidGAuthCode:
            return "GAuth 로그인에서 문제가 생겼습니다. 지속될 시 문의해주세요."

        case .internalServerError:
            return "서버에서 문제가 발생하였습니다. 지속될 시 문의해주세요."
        }
    }
}
