import Foundation

public protocol UserRepository {
    func saveUserRole(role: UserRoleType)
    func loadUserRole() -> UserRoleType
    func fetchMyMiniProfile() async throws -> String
    func fetchMyProfile() async throws -> MyPageEntity
}
