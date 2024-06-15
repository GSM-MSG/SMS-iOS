import AuthenticationDomainInterface

struct InputAuthenticationUseCaseImpl: InputAuthenticationUseCase {
    private let authenticationRepository: any AuthenticationRepository

    init(authenticationRepository: any AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }

    func execute(uuid: String, req: InputAuthenticationRequestDTO) async throws {
        try await authenticationRepository.inputAuthentication(uuid: uuid, req: req)
    }
}
