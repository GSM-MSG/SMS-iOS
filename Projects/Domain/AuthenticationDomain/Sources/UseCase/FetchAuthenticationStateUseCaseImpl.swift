import AuthenticationDomainInterface

struct FetchAuthenticationStateUseCaseImpl: FetchAuthenticationStateUseCase {
    private let authenticationRepository: any AuthenticationRepository

    init(authenticationRepository: any AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }

    func execute() async throws -> AuthenticationStateEntity {
        try await authenticationRepository.fetchAuthenticationState()
    }
}
