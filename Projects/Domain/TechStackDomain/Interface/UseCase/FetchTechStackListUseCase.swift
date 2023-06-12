import Foundation

public protocol FetchTechStackListUseCase {
    func execute(keyword: String) async throws -> [String]
}
