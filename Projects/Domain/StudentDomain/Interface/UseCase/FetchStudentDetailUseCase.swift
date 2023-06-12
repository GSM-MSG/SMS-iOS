import Foundation

public protocol FetchStudentDetailUseCase {
    func execute(userID: String, viewee: FetchStudentDetailViewType) async throws -> StudentDetailEntity
}

public enum FetchStudentDetailViewType {
    case student
    case teacher
    case guest
}
