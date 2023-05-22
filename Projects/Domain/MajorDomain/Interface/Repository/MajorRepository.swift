import Foundation

public protocol MajorRepository {
    func fetchList() async throws -> [String]
}
