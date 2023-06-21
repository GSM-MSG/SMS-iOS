import Foundation

public protocol LocalUserDataSource {
    func saveUserRole(role: UserRoleType)
    func loadUserRole() -> UserRoleType
}
