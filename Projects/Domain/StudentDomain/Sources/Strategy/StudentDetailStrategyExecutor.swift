import Foundation
import StudentDomainInterface

public struct StudentDetailStrategyExecutor {
    private let studentDetailViewStrategy: any StudentDetailViewStrategy

    init(studentDetailViewStrategy: any StudentDetailViewStrategy) {
        self.studentDetailViewStrategy = studentDetailViewStrategy
    }

    func execute(userID: String) async throws -> StudentDetailEntity {
        try await studentDetailViewStrategy.fetchStudentInfo(userID: userID)
    }
}
