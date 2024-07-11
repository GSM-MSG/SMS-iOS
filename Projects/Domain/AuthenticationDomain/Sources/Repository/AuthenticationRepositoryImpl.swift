import AuthenticationDomainInterface

struct AuthenticationRepositoryImpl: AuthenticationRepository {
    private let remoteAuthenticationDataSource: any RemoteAuthenticationDataSource

    init(remoteAuthenticationDataSource: any RemoteAuthenticationDataSource) {
        self.remoteAuthenticationDataSource = remoteAuthenticationDataSource
    }

    func fetchAuthenticationForm() async throws -> AuthenticationFormEntity {
        try await remoteAuthenticationDataSource.fetchAuthenticationForm()
    }

    func inputAuthentication(req: InputAuthenticationRequestDTO) async throws {
        try await remoteAuthenticationDataSource.inputAuthentication(req: req)
    }

    func fetchAuthenticationState() async throws -> AuthenticationStateEntity {
        try await remoteAuthenticationDataSource.fetchAuthenticationState()
    }
}
