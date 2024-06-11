import AuthenticationDomainInterface
import BaseDomain

final class RemoteAuthenticationDataSourceImpl: BaseRemoteDataSource<AuthenticationEndpoint>, RemoteAuthenticationDataSource {
    func fetchAuthenticationForm(uuid: String) async throws -> AuthenticationFormEntity {
        try await request(.fetchAuthenticationForm(uuid: uuid), dto: AuthenticationFormResponseDTO.self).toDomain()
    }

    func inputAuthentication(uuid: String, req: InputAuthenticationRequestDTO) async throws {
        try await request(.inputAuthentication(uuid: uuid, req: req))
    }
}
