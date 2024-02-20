import TeacherDomainInterface

struct DeputyPrincipalSignupUseCaseImpl: DeputyPrincipalSignupUseCase {
    private let teacherRepository: any TeacherRepository
    
    init(teacherRepository: any TeacherRepository) {
        self.teacherRepository = teacherRepository
    }
    
    func execute() async throws {
        try await teacherRepository.deputyPrincipal()
    }
}
