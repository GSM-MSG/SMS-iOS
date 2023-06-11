public protocol UserDomainBuildable {
    var userRepository: any UserRepository { get }
    var loadUserRoleUseCase: any LoadUserRoleUseCase { get }
    var saveUserRoleUseCase: any SaveUserRoleUseCase { get }
}
