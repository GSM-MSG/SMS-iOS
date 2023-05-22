import Foundation

public protocol FetchListUseCase {
    func execute() async throws -> [String]
}
