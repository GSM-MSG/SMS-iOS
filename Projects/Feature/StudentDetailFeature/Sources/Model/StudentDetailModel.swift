import Foundation
import UserDomainInterface
import StudentDomainInterface

final class StudentDetailModel: ObservableObject, StudentDetailStateProtocol {
    @Published var userRole: UserRoleType = .guest
    var studentDetailEntity: StudentDetailEntity? {
        get {
            _studentDetailEntity.map {
                StudentDetailEntity(
                    name: $0.name.replacingOccurrences(of: "**", with: "소금"),
                    introduce: $0.introduce,
                    major: $0.major,
                    profileImageURL: $0.profileImageURL,
                    techStacks: $0.techStacks,
                    detailInfoByStudent: $0.detailInfoByStudent,
                    detailInfoByTeacher: $0.detailInfoByTeacher
                )
            }
        }
        set { _studentDetailEntity = newValue }
    }
    @Published var _studentDetailEntity: StudentDetailEntity?
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
