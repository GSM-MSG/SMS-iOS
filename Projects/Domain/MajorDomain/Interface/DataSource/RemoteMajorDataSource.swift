import Foundation

public protocol RemoteMajorDataSource {
    func fetchMajorList() async throws -> [String]
}
