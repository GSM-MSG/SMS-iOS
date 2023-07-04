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
        #warning("통신 오류 남")
//        try await remoteAuthDataSource.logout()
        try await localAuthDataSource.logout()
    }

    func withdrawal() async throws {
        try await remoteAuthDataSource.withdrawal()
        try await localAuthDataSource.withdrawal()
    }

    func refresh() async throws {
        try await remoteAuthDataSource.refresh()
    }

    func verifyIsExistUser() async throws -> Bool {
        try await remoteAuthDataSource.verifyIsExistUser()
    }

    func clearToken() {
        localAuthDataSource.clearToken()
    }
}
