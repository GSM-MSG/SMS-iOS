import AuthDomainInterface

final class AuthRepositorySpy: AuthRepository {
    var loginCallCount = 0
    func login(code: String) async throws -> UserSignupInfoEntity {
        loginCallCount += 1
        if code.isEmpty {
            throw AuthDomainError.failedToGAuthSignin
        }
        return .init(isAlreadySignup: true, userRole: .guest)
    }

    var logoutCallCount = 0
    func logout() async throws {
        logoutCallCount += 1
    }

    var withdrawalCallCount = 0
    func withdrawal() async throws {
        withdrawalCallCount += 1
    }
}
