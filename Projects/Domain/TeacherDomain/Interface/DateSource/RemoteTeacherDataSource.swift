import Foundation

public protocol RemoteTeacherDataSource {
    func common() async throws
    func principal() async throws
    func deputyPrincipal() async throws
    func director() async throws
    func homeroom(grade: Int, classNum: Int) async throws
}
