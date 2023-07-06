import UserDomainInterface

struct FetchMyProfileUseCaseImpl: FetchMyProfileUseCase {
    private let userRepository: any UserRepository

    init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    func execute() async throws -> MyPageEntity {
        try await userRepository.fetchMyProfile()
    }
}
