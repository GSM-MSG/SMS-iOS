import AuthDomainInterface

final class LoginUseCaseSpy: LoginUseCase {
    var callCount = 0
    func execute(code: String) async throws -> UserSignupInfoEntity {
        callCount += 1
        if code.isEmpty {
            throw AuthDomainError.failedToGAuthSignin
        }
        return .init(isAlreadySignup: true, userRole: .guest)
    }
}
