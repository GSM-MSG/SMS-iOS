import Foundation
import StudentDomainInterface

struct StudentDetailByTeacherStrategy: StudentDetailViewStrategy {
    private let studentRepository: any StudentRepository

    init(studentRepository: any StudentRepository) {
        self.studentRepository = studentRepository
    }

    func fetchStudentInfo(userID: String) async throws -> StudentDetailEntity {
        try await studentRepository.fetchStudentDetailByTeacher(userID: userID)
    }
}
