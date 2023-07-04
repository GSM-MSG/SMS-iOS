import AuthDomainInterface
import UserDomainInterface

final class LocalAuthDataSourceSpy: LocalAuthDataSource {
    var logoutCallCount = 0
    func logout() async throws {
        logoutCallCount += 1
    }

    var withdrawalCallCount = 0
    func withdrawal() async throws {
        withdrawalCallCount += 1
    }

    var clearTokenCallCount = 0
    func clearToken() {
        clearTokenCallCount += 1
    }
}
