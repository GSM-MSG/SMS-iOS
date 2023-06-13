import AuthDomainInterface
import BaseDomain

final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<AuthEndpoint>, RemoteAuthDataSource {
    func login(code: String) async throws -> UserSignupInfoEntity {
        try await request(.signin(code: code), dto: SigninResponseDTO.self)
            .toDomain()
    }

    func logout() async throws {
        try await request(.logout)
    }

    func withdrawal() async throws {
        try await request(.withdrawal)
    }

    func refresh() async throws {
        try await request(.refresh)
    }

    func verifyIsExistUser() async throws -> Bool {
        try await request(.verifyIsExistUser, dto: VerifyIsInputedUserResponseDTO.self)
            .isExist
    }
}
