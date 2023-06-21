import Foundation

public protocol UserRepository {
    func saveUserRole(role: UserRoleType)
    func loadUserRole() -> UserRoleType
}
