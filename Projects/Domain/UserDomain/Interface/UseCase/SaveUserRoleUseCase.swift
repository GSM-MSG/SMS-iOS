import Foundation

public protocol SaveUserRoleUseCase {
    func execute(role: UserRoleType)
}
