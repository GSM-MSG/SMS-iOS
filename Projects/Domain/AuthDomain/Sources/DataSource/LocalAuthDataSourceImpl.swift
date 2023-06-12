import Foundation
import UserDomainInterface

struct LocalAuthDataSourceImpl: LocalUserDataSource {
    private enum UserDefaultsKey {
        static let userRole = "USER_ROLE"
    }

    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func saveUserRole(role: UserRoleType) {
        userDefaults.setValue(role.rawValue, forKey: UserDefaultsKey.userRole)
    }

    func loadUserRole() -> UserRoleType {
        let userRole = userDefaults.string(forKey: UserDefaultsKey.userRole)
        if let userRole {
            return UserRoleType(rawValue: userRole) ?? .guest
        } else {
            return .guest
        }
    }
}
