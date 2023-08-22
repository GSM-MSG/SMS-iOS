import StudentDomainInterface

struct ModifyInformationUseCaseImpl: ModifyInformationUseCase {
    private let studentRepository: any StudentRepository

    init(studentRepository: any StudentRepository) {
        self.studentRepository = studentRepository
    }

    func execute(req: ModifyStudentInformationRequestDTO) async throws {
        try await studentRepository.modifyInformation(req: req)
    }
}
