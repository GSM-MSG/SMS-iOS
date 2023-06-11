import Foundation
import UserDomainInterface

protocol StudentDetailStateProtocol {
    var userRole: UserRoleType { get }
}

protocol StudentDetailActionProtocol: AnyObject {
    func updateUserRole(role: UserRoleType)
}
