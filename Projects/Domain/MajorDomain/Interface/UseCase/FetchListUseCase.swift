import Foundation

public protocol FetchMajorListUseCase {
    func execute() async throws -> [String]
}
