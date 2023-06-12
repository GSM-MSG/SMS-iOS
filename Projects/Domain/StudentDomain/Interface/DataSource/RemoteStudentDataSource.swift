import Foundation

public protocol RemoteStudentDataSource {
    func inputInformation(req: InputStudentInformationRequestDTO) async throws
    func fetchStudentList(req: FetchStudentListRequestDTO) async throws -> PagedStudentListEntity
    func fetchStudentDetailByStudent(userID: String) async throws -> StudentDetailEntity
    func fetchStudentDetailByGuest(userID: String) async throws -> StudentDetailEntity
    func fetchStudentDetailByTeacher(userID: String) async throws -> StudentDetailEntity
}
