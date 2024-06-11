import AuthenticationDomainInterface

struct FetchAuthenticationFormUseCaseImpl: FetchAuthenticationFormUseCase {
    private let authenticationRepository: any AuthenticationRepository

    init(authenticationRepository: any AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }

    func execute(uuid: String) async throws -> AuthenticationFormEntity {
        try await authenticationRepository.fetchAuthenticationForm(uuid: uuid)
    }
}
