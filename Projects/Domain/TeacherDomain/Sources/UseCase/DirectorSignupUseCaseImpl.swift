import TeacherDomainInterface

struct DirectorSignupUseCaseImpl: DirectorSignupUseCase {
    private let teacherRepository: any TeacherRepository

    init(teacherRepository: any TeacherRepository) {
        self.teacherRepository = teacherRepository
    }

    func execute() async throws {
        try await teacherRepository.director()
    }
}
