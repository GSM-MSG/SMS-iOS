import TeacherDomainInterface

struct CommonSignupUseCaseImpl: CommonSignupUseCase {
    private let teacherRepository: any TeacherRepository
    
    init(teacherRepository: any TeacherRepository) {
        self.teacherRepository = teacherRepository
    }
    
    func execute() async throws {
        try await teacherRepository.common()
    }
}
