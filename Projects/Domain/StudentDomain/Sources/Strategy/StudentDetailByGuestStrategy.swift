import Foundation
import StudentDomainInterface

struct StudentDetailByGuestStrategy: StudentDetailViewStrategy {
    private let studentRepository: any StudentRepository

    init(studentRepository: any StudentRepository) {
        self.studentRepository = studentRepository
    }

    func fetchStudentInfo(userID: String) async throws -> StudentDetailEntity {
        try await studentRepository.fetchStudentDetailByStudent(userID: userID)
    }
}
