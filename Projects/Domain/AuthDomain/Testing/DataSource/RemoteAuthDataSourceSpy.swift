import AuthDomainInterface
import UserDomainInterface

final class RemoteAuthDataSourceSpy: RemoteAuthDataSource {
    var loginCallCount = 0
    func login(code: String) async throws -> UserSignupInfoEntity {
        loginCallCount += 1
        if code.isEmpty {
            throw AuthDomainError.failedToGAuthSignin
        }
        return .init(isAlreadySignup: true, userRole: .guest)
    }
}
