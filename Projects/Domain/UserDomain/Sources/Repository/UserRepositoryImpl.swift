import Foundation
import UserDomainInterface

struct UserRepositoryImpl: UserRepository {
    private let localUserDataSource: any LocalUserDataSource
    private let remoteUserDataSource: any RemoteUserDataSource

    init(
        localUserDataSource: any LocalUserDataSource,
        remoteUserDataSource: any RemoteUserDataSource
    ) {
        self.localUserDataSource = localUserDataSource
        self.remoteUserDataSource = remoteUserDataSource
    }

    func saveUserRole(role: UserRoleType) {
        localUserDataSource.saveUserRole(role: role)
    }

    func loadUserRole() -> UserRoleType {
        localUserDataSource.loadUserRole()
    }

    func fetchMyMiniProfile() async throws -> String {
        try await remoteUserDataSource.fetchMyMiniProfile()
    }

    func fetchMyProfile() async throws -> MyPageEntity {
        try await remoteUserDataSource.fetchMyProfile()
    }
}
