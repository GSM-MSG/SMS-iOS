import StudentDomainInterface
import BaseDomain

final class RemoteStudentDataSourceImpl: BaseRemoteDataSource<StudentEndpoint>, RemoteStudentDataSource {
    func inputInformation(req: StudentRequestDTO) async throws {
        try await request(.inputInformation(req))
    }
}
