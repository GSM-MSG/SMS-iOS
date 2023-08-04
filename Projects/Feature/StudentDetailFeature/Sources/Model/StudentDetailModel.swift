import Foundation
import UserDomainInterface
import StudentDomainInterface

// swiftlint: disable identifier_name
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
                    projects: $0.projects,
                    prizes: $0.prizes,
                    detailInfoByStudent: $0.detailInfoByStudent,
                    detailInfoByTeacher: $0.detailInfoByTeacher
                )
            }
        }
        set { _studentDetailEntity = newValue }
    }
    @Published var _studentDetailEntity: StudentDetailEntity?
    @Published var isLoading: Bool = false
    @Published var isDownloading: Bool = false
    @Published var hwpDocument: HWPDocument?
    var hwpFilename: String {
        guard let studentDetailEntity, let info = studentDetailEntity.detailInfoByTeacher else { return "" }
        let number = info.number >= 10 ? "\(info.number)" : "0\(info.number)"
        return "\(info.grade)\(info.class)\(number)\(studentDetailEntity.name)-드림북.hwp"
    }
}
// swiftlint: enable identifier_name

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

    func updateIsDownloading(isDownloading: Bool) {
        self.isDownloading = isDownloading
    }

    func updateHWPDocument(hwpDocument: HWPDocument) {
        self.hwpDocument = hwpDocument
    }
}
