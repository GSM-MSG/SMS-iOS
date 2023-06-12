import Foundation

public protocol StudentDetailViewStrategy {
    func fetchStudentInfo(userID: String) async throws -> StudentDetailEntity
}
