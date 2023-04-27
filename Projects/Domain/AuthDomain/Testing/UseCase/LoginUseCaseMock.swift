import AuthDomainInterface

struct LoginUseCaseMock: LoginUseCase {
    func execute(code: String) async throws {
        if code.isEmpty {
            throw AuthDomainError.invalidGAuthCode
        }
    }
}
