import UserDomainInterface

struct SaveUserRoleUseCaseImpl: SaveUserRoleUseCase {
    private let userRepository: any UserRepository

    init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    func execute(role: UserRoleType) {
        userRepository.loadUserRole()
    }
}
