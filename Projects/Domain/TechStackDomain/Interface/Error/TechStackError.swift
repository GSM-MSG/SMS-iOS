import Foundation

public enum TechStackError: Error {
    case invalidRequest
}

extension TechStackError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return "알 수 없는 에러가 발생하였습니다."
        }
    }
}
