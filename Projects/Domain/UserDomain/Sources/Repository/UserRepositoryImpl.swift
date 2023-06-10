import Foundation
import UserDomainInterface

struct UserRepositoryImpl: UserRepository {
    private let localUserDataSource: any LocalUserDataSource

    init(localUserDataSource: any LocalUserDataSource) {
        self.localUserDataSource = localUserDataSource
    }

    func saveUserRole(role: UserRoleType) {
        localUserDataSource.saveUserRole(role: role)
    }

    func loadUserRole() -> UserRoleType {
        localUserDataSource.loadUserRole()
    }
}
