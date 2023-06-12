import Foundation
import UserDomainInterface
import StudentDomainInterface

protocol StudentDetailStateProtocol {
    var userRole: UserRoleType { get }
    var studentDetailEntity: StudentDetailEntity? { get }
    var isLoading: Bool { get }
}

protocol StudentDetailActionProtocol: AnyObject {
    func updateUserRole(role: UserRoleType)
    func updateStudentDetailEntity(entity: StudentDetailEntity)
    func updateIsLoading(isLoading: Bool)
}
