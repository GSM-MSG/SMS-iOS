import Foundation
import TeacherDomainInterface

struct TeacherRepositoryImpl: TeacherRepository {
    private let remoteTeacherDataSource: any RemoteTeacherDataSource

    init(remoteTeacherDataSource: any RemoteTeacherDataSource) {
        self.remoteTeacherDataSource = remoteTeacherDataSource
    }

    func common() async throws {
        try await remoteTeacherDataSource.common()
    }

    func principal() async throws {
        try await remoteTeacherDataSource.principal()
    }

    func deputyPrincipal() async throws {
        try await remoteTeacherDataSource.deputyPrincipal()
    }

    func director() async throws {
        try await remoteTeacherDataSource.director()
    }

    func homeroom(grade: Int, classNum: Int) async throws {
        try await remoteTeacherDataSource.homeroom(grade: grade, classNum: classNum)
    }
}
