import Foundation

public protocol RemoteStudentDataSource {
    func fetchList() async throws -> [String]
}
