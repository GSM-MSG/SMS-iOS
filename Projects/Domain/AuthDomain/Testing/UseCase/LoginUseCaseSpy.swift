import AuthDomainInterface

final class LoginUseCaseSpy: LoginUseCase {
    var callCount = 0
    func execute(code: String) async throws {
        callCount += 1
        if code.isEmpty {
            throw AuthDomainError.invalidGAuthCode
        }
    }
}