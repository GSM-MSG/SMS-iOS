import Foundation

public protocol StudentRepository {
    func inputInformation(req: InputStudentInformationRequestDTO) async throws
    func fetchStudentList(req: FetchStudentListRequestDTO) async throws -> PagedStudentListEntity
}
