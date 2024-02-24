import Foundation

public enum TeacherDomainError: Error {
    case invalidRequest
    case alreadyExistUser
}

extension TeacherDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return "알 수 없는 에러가 발생하였습니다."
        case .alreadyExistUser:
            return "이미 가입을 완료한 유저입니다."
        }
    }
}
