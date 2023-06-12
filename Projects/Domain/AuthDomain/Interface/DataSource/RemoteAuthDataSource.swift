import Foundation

public protocol RemoteAuthDataSource {
    func login(code: String) async throws -> UserSignupInfoEntity
    func logout() async throws
}
