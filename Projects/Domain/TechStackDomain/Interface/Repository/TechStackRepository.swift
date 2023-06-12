import Foundation

public protocol TechStackRepository {
    func fetchTechStackList(keyword: String) async throws -> [String]
}
