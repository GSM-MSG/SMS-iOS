import Foundation

public protocol RemoteMajorDataSource {
    func fetchList() async throws -> [String]
}
