import StudentDomainInterface

struct FetchStudentListUseCaseImpl: FetchStudentListUseCase {
    private let studentRepository: any StudentRepository

    init(studentRepository: any StudentRepository) {
        self.studentRepository = studentRepository
    }

    func execute(req: FetchStudentListRequestDTO) async throws -> PagedStudentListEntity {
        try await studentRepository.fetchStudentList(req: req)
    }
}
