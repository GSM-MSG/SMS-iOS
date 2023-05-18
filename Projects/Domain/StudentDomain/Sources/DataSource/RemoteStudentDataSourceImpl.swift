import StudentDomainInterface
import BaseDomain

final class RemoteStudentDataSourceImpl: BaseRemoteDataSource<StudentEndpoint>, RemoteStudentDataSource {
    func inputInformation(req: InputStudentInformationRequestDTO) async throws {
        try await request(.inputInformation(req))
    }
}
