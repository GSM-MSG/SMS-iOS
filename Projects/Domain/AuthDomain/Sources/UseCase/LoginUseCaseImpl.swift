import AuthDomainInterface

struct LoginUseCaseImpl: LoginUseCase {
    private let authRepository: any AuthRepository

    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    func execute(code: String) async throws -> UserSignupInfoEntity {
        try await authRepository.login(code: code)
    }
}
