import Foundation

public protocol RemoteTechStackDataSource {
    func fetchTechStackList(keyword: String) async throws -> [String]
}
