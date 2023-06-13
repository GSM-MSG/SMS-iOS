import Foundation

public protocol FetchStudentListUseCase {
    func execute(req: FetchStudentListRequestDTO) async throws -> PagedStudentListEntity
}
