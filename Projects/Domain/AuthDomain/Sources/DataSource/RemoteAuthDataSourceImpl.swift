import AuthDomainInterface
import BaseDomain

final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<AuthEndpoint>, RemoteAuthDataSource {
    func login(code: String) async throws -> IsAlreadySignUp {
        try await request(.signin(code: code), dto: SigninResponseDTO.self)
            .isExist
    }
}
