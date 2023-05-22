import MajorDomainInterface
import Foundation

struct MajorRepositoryImpl: MajorRepository {
    private let remoteMajorDataSource: any RemoteMajorDataSource

    init(remoteMajorDataSource: any RemoteMajorDataSource) {
        self.remoteMajorDataSource = remoteMajorDataSource
    }

    func fetchList() async throws -> [String] {
        try await remoteMajorDataSource.fetchList()
    }
}
