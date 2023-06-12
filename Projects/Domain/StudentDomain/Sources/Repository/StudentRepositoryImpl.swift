import StudentDomainInterface
import Foundation

struct StudentRepositoryImpl: StudentRepository {
    private let remoteStudentDataSource: any RemoteStudentDataSource

    init(remoteStudentDataSource: any RemoteStudentDataSource) {
        self.remoteStudentDataSource = remoteStudentDataSource
    }

    func inputInformation(req: InputStudentInformationRequestDTO) async throws {
        try await remoteStudentDataSource.inputInformation(req: req)
    }

    func fetchStudentList(req: FetchStudentListRequestDTO) async throws -> PagedStudentListEntity {
        try await remoteStudentDataSource.fetchStudentList(req: req)
    }

    func fetchStudentDetailByStudent(userID: String) async throws -> StudentDetailEntity {
        try await remoteStudentDataSource.fetchStudentDetailByStudent(userID: userID)
    }
}
