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

    func fetchStudentDetailByStudent(userID: String) async throws -> StudentDetailEntity {
        try await request(
            .fetchStudentDetailByStudent(userID: userID),
            dto: FetchStudentDetailByStudentResponseDTO.self
        )
        .toDomain()
    }

    func fetchStudentDetailByGuest(userID: String) async throws -> StudentDetailEntity {
        try await request(
            .fetchStudentDetailByStudent(userID: userID),
            dto: FetchStudentDetailByStudentResponseDTO.self
        )
        .toDomain()
    }

    func fetchStudentDetailByTeacher(userID: String) async throws -> StudentDetailEntity {
        try await request(
            .fetchStudentDetailByStudent(userID: userID),
            dto: FetchStudentDetailByTeacherResponseDTO.self
        )
        .toDomain()
    }
}
