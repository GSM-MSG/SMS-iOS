import AuthDomainInterface

final class RemoteAuthDataSourceSpy: RemoteAuthDataSource {
    var loginCallCount = 0
    func login(code: String) async throws {
        loginCallCount += 1
        if code.isEmpty {
            throw AuthDomainError.invalidGAuthCode
        }
    }
}
