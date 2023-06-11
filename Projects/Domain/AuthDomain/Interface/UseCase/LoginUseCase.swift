import Foundation

public protocol LoginUseCase {
    func execute(code: String) async throws -> UserSignupInfoEntity
}
