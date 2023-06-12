import TechStackDomainInterface

struct TechStackRepositoryImpl: TechStackRepository {
    private let remoteTechStackDataSource: any RemoteTechStackDataSource

    init(remoteTechStackDataSource: any RemoteTechStackDataSource) {
        self.remoteTechStackDataSource = remoteTechStackDataSource
    }

    func fetchTechStackList(keyword: String) async throws -> [String] {
        try await remoteTechStackDataSource.fetchTechStackList(keyword: keyword)
    }
}
