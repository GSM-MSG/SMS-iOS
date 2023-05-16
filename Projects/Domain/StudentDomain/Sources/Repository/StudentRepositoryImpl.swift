import StudentDomainInterface
import Foundation

struct StudentRepositoryImpl: StudentRepository {
    private let remoteStudentDataSource: any RemoteStudentDataSource

    init(remoteStudentDataSource: any RemoteStudentDataSource) {
        self.remoteStudentDataSource = remoteStudentDataSource
    }

    func inputInformation(req: StudentRequestDTO) async throws {
        try await remoteStudentDataSource.inputInformation(req: req)
    }
}
