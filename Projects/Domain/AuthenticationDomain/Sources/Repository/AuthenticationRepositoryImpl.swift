import AuthenticationDomainInterface

struct AuthenticationRepositoryImpl: AuthenticationRepository {
    private let remoteAuthenticationDataSource: any RemoteAuthenticationDataSource

    init(remoteAuthenticationDataSource: any RemoteAuthenticationDataSource) {
        self.remoteAuthenticationDataSource = remoteAuthenticationDataSource
    }

    func fetchAuthenticationForm(uuid: String) async throws -> AuthenticationFormEntity {
        try await remoteAuthenticationDataSource.fetchAuthenticationForm(uuid: uuid)
    }

    func inputAuthentication(uuid: String, req: InputAuthenticationRequestDTO) async throws {
        try await remoteAuthenticationDataSource.inputAuthentication(uuid: uuid, req: req)
    }
}
