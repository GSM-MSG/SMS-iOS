import Foundation
import UserDomainInterface
import StudentDomainInterface

final class StudentDetailModel: ObservableObject, StudentDetailStateProtocol {
    @Published var userRole: UserRoleType = .guest
    @Published var studentDetailEntity: StudentDetailEntity?
    @Published var isLoading: Bool = false
}

extension StudentDetailModel: StudentDetailActionProtocol {
    func updateUserRole(role: UserRoleType) {
        self.userRole = role
    }

    func updateStudentDetailEntity(entity: StudentDetailEntity) {
        self.studentDetailEntity = entity
    }

    func updateIsLoading(isLoading: Bool) {
        self.isLoading = isLoading
    }
}
