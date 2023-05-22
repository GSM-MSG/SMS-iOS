import AuthDomainInterface

struct FetchListUseCaseImpl: FetchListUseCase {
    private let majorRepository: any MajorRepository

    init(majorRepository: any MajorRepository) {
        self.majorRepository = majorRepository
    }

    func execute() async throws -> [String] {
        try await majorRepository.fetchList()
    }
}
