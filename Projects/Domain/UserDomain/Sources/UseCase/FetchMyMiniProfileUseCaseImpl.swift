import UserDomainInterface

struct FetchMyMiniProfileUseCaseImpl: FetchMyMiniProfileUseCase {
    private let userRepository: any UserRepository

    init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    func execute() async throws -> String {
        try await userRepository.fetchMyMiniProfile()
    }
}
