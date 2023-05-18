import StudentDomainInterface

struct InputInformationCaseImpl: InputInformationUseCase {
    private let studentRepository: any StudentRepository

    init(studentRepository: any StudentRepository) {
        self.studentRepository = studentRepository
    }

    func execute(req: InputStudentInformationRequestDTO) async throws {
        try await studentRepository.inputInformation(req: req)
    }
}
