import Foundation
import AuthDomainInterface
import JwtStoreInterface

struct LocalAuthDataSourceImpl: LocalAuthDataSource {
    private let jwtStore: JwtStore

    init(jwtStore: JwtStore) {
        self.jwtStore = jwtStore
    }

    func logout() async throws {
        jwtStore.delete(property: .accessToken)
        jwtStore.delete(property: .accessExpiresAt)
        jwtStore.delete(property: .refreshToken)
        jwtStore.delete(property: .refreshExpiresAt)
    }

    func withdrawal() async throws {
        jwtStore.delete(property: .accessToken)
        jwtStore.delete(property: .accessExpiresAt)
        jwtStore.delete(property: .refreshToken)
        jwtStore.delete(property: .refreshExpiresAt)
    }

    func clearToken() {
        jwtStore.delete(property: .accessToken)
        jwtStore.delete(property: .accessExpiresAt)
        jwtStore.delete(property: .refreshToken)
        jwtStore.delete(property: .refreshExpiresAt)
    }
}
