import AuthDomainInterface

struct CheckIsLoggedInUseCaseImpl: CheckIsLoggedInUseCase {
    private let authRepository: any AuthRepository

    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    func execute() async throws {
        guard try await authRepository.verifyIsExistUser() else {
            throw AuthDomainError.notExistUserInputed
        }
        try await authRepository.refresh()
    }
}
