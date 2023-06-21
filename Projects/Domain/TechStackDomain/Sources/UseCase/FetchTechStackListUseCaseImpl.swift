import TechStackDomainInterface

struct FetchTechStackListUseCaseImpl: FetchTechStackListUseCase {
    private let techStackRepository: any TechStackRepository

    init(techStackRepository: any TechStackRepository) {
        self.techStackRepository = techStackRepository
    }

    func execute(keyword: String) async throws -> [String] {
        try await techStackRepository.fetchTechStackList(keyword: keyword)
    }
}
