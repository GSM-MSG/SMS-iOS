import Foundation

public protocol AuthRepository {
    func login(code: String) async throws -> UserSignupInfoEntity
}
