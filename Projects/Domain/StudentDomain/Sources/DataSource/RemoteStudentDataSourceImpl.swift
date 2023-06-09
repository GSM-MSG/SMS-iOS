import StudentDomainInterface
import BaseDomain

final class RemoteStudentDataSourceImpl: BaseRemoteDataSource<StudentEndpoint>, RemoteStudentDataSource {
    func inputInformation(req: InputStudentInformationRequestDTO) async throws {
        try await request(.inputInformation(req))
    }

    func fetchStudentList(req: FetchStudentListRequestDTO) async throws -> PagedStudentListEntity {
        try await request(.fetchStudentList(req), dto: FetchStudentListResponseDTO.self)
            .toDomain()
    }
}
