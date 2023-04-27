import AuthDomainInterface

struct RemoteAuthDataSourceMock: RemoteAuthDataSource {
    func login(code: String) async throws {
        if code.isEmpty {
            throw AuthDomainError.invalidGAuthCode
        }
    }
}
