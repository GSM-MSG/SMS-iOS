import BaseDomain

final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<AuthEndpoint>, RemoteAuthDataSource {
    func login(code: String) async throws {
        try await request(.signin(code: code))
    }
}
