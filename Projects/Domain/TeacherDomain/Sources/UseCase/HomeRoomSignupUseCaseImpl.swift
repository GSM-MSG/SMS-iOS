import TeacherDomainInterface

struct HomeRoomSignupUseCaseImpl: HomeRoomSignupUseCase {
    private let teacherRepository: any TeacherRepository

    init(teacherRepository: any TeacherRepository) {
        self.teacherRepository = teacherRepository
    }

    func execute(grade: Int, classNum: Int) async throws {
        try await teacherRepository.homeroom(grade: grade, classNum: classNum)
    }
}
