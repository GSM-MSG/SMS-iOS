import Foundation

public protocol MajorRepository {
    func fetchMajorList() async throws -> [String]
}
