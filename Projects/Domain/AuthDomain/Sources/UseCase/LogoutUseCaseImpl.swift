import AuthDomainInterface

struct LogoutUseCaseImpl: LogoutUseCase {
    private let authRepository: any AuthRepository

    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    func execute() async throws {
        return try await authRepository.logout()
    }
}
