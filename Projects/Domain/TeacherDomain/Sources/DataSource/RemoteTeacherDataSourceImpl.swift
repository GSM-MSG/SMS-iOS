import BaseDomain
import TeacherDomainInterface

final class RemoteTeacherDataSourceImpl: BaseRemoteDataSource<TeacherEndPoint>, RemoteTeacherDataSource {
    func common() async throws {
        try await request(.common)
    }

    func principal() async throws {
        try await request(.principal)
    }

    func deputyPrincipal() async throws {
        try await request(.deputyPrincipal)
    }

    func director() async throws {
        try await request(.director)
    }

    func homeroom(grade: Int, classNum: Int) async throws {
        try await request(.homeroom(grade: grade, classNum: classNum))
    }
}
