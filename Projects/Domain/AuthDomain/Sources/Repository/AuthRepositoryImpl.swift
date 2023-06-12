import AuthDomainInterface
import Foundation

struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: any RemoteAuthDataSource
    private let localAuthDataSource: any LocalAuthDataSource

    init(
        remoteAuthDataSource: any RemoteAuthDataSource,
        localAuthDataSource: any LocalAuthDataSource
    ) {
        self.remoteAuthDataSource = remoteAuthDataSource
        self.localAuthDataSource = localAuthDataSource
    }

    func login(code: String) async throws -> UserSignupInfoEntity {
        try await remoteAuthDataSource.login(code: code)
    }

    func logout() async throws {
        try await remoteAuthDataSource.logout()
        try await localAuthDataSource.logout()
    }
}
