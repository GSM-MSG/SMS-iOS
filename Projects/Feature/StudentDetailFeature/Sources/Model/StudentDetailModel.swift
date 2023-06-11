import Foundation
import UserDomainInterface

final class StudentDetailModel: ObservableObject, StudentDetailStateProtocol {
    var userRole: UserRoleType = .guest
}

extension StudentDetailModel: StudentDetailActionProtocol {
    func updateUserRole(role: UserRoleType) {
        self.userRole = role
    }
}
