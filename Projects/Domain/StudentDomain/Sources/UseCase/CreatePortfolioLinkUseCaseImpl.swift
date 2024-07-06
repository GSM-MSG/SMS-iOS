import StudentDomainInterface

struct CreatePortfolioLinkUseCaseImpl: CreatePortfolioLinkUseCase {
    private let studentRepository: any StudentRepository

    init(studentRepository: any StudentRepository) {
        self.studentRepository = studentRepository
    }

    func execute(req: CreatePortfolioLinkRequestDTO) async throws -> PortfolioLinkEntity {
        try await studentRepository.createPortfolioLink(req: req)
    }
}
