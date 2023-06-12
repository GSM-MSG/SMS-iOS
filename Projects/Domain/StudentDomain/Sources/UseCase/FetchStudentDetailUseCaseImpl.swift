import StudentDomainInterface

struct FetchStudentDetailUseCaseImpl: FetchStudentDetailUseCase {
    private let studentRepository: any StudentRepository

    init(studentRepository: any StudentRepository) {
        self.studentRepository = studentRepository
    }

    func execute(
        userID: String,
        viewee: FetchStudentDetailViewType
    ) async throws -> StudentDetailEntity {
        let strategy = viewee.toStrategy(studentRepository: studentRepository)

        let strategyExecutor = StudentDetailStrategyExecutor(studentDetailViewStrategy: strategy)
        return try await strategyExecutor.execute(userID: userID)
    }
}

private extension FetchStudentDetailViewType {
    func toStrategy(studentRepository: any StudentRepository) -> any StudentDetailViewStrategy {
        switch self {
        case .student:
            return StudentDetailByStudentStrategy(studentRepository: studentRepository)

        case .guest:
            return StudentDetailByGuestStrategy(studentRepository: studentRepository)

        case .teacher:
            return StudentDetailByTeacherStrategy(studentRepository: studentRepository)

        default:
            return StudentDetailByGuestStrategy(studentRepository: studentRepository)
        }
    }
}
