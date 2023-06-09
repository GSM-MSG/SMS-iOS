import Foundation

public protocol RemoteStudentDataSource {
    func inputInformation(req: InputStudentInformationRequestDTO) async throws
    func fetchStudentList(req: FetchStudentListRequestDTO) async throws -> PagedStudentListEntity
}
