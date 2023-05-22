import AuthDomainInterface
import Foundation

struct AuthRepositoryImpl: AuthRepository {
    private let remoteAuthDataSource: any RemoteAuthDataSource

    init(remoteAuthDataSource: any RemoteAuthDataSource) {
        self.remoteAuthDataSource = remoteAuthDataSource
    }

    func login(code: String) async throws -> IsAlreadySignUp {
        try await remoteAuthDataSource.login(code: code)
    }
}
