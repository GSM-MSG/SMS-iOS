import AuthDomainInterface

struct ClearTokenUseCaseImpl: ClearTokenUseCase {
    private let authRepository: any AuthRepository

    init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    func execute() {
        authRepository.clearnToken()
    }
}
