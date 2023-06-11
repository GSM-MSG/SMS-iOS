import UserDomainInterface

struct LoadUserRoleUseCaseImpl: LoadUserRoleUseCase {
    private let userRepository: any UserRepository

    init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    func execute() -> UserRoleType {
        userRepository.loadUserRole()
    }
}
