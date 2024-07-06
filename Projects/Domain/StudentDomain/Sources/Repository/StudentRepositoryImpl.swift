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

    func fetchStudentDetailByGuest(userID: String) async throws -> StudentDetailEntity {
        try await remoteStudentDataSource.fetchStudentDetailByGuest(userID: userID)
    }

    func fetchStudentDetailByTeacher(userID: String) async throws -> StudentDetailEntity {
        try await remoteStudentDataSource.fetchStudentDetailByTeacher(userID: userID)
    }

    func modifyInformation(req: ModifyStudentInformationRequestDTO) async throws {
        try await remoteStudentDataSource.modifyInformation(req: req)
    }

    func createPortfolioLink(req: CreatePortfolioLinkRequestDTO) async throws -> PortfolioLinkEntity {
        try await remoteStudentDataSource.createPortfolioLink(req: req)
    }
}
