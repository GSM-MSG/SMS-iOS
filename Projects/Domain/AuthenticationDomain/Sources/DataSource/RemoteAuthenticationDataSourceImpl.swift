import AuthenticationDomainInterface
import BaseDomain

final class RemoteAuthenticationDataSourceImpl: BaseRemoteDataSource<AuthenticationEndpoint>, RemoteAuthenticationDataSource {
    func fetchAuthenticationForm() async throws -> AuthenticationFormEntity {
        try await request(.fetchAuthenticationForm, dto: AuthenticationFormResponseDTO.self).toDomain()
    }

    func inputAuthentication(req: InputAuthenticationRequestDTO) async throws {
        try await request(.inputAuthentication(req: req))
    }

    func fetchAuthenticationState() async throws -> AuthenticationStateEntity {
        try await request(.fetchAuthenticationState, dto: AuthenticationStateResponseDTO.self).toDomain()
    }
}
