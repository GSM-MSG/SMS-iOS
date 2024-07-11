import AuthenticationDomainInterface

struct InputAuthenticationUseCaseImpl: InputAuthenticationUseCase {
    private let authenticationRepository: any AuthenticationRepository

    init(authenticationRepository: any AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }

    func execute(req: InputAuthenticationRequestDTO) async throws {
        try await authenticationRepository.inputAuthentication(req: req)
    }
}
