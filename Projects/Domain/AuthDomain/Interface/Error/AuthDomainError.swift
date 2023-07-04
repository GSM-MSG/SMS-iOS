import Foundation

public enum AuthDomainError: Error {
    case failedToGAuthSignin
    case notExistUserInputed
    case internalServerError
}

extension AuthDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .failedToGAuthSignin:
            return "GAuth 로그인에서 문제가 생겼습니다. 지속될 시 문의해주세요."

        case .notExistUserInputed:
            return "정보 입력을 완료하지 않은 계정입니다. 로그인부터 다시 시도해주세요."

        case .internalServerError:
            return "서버에서 문제가 발생하였습니다. 지속될 시 문의해주세요."
        }
    }
}
