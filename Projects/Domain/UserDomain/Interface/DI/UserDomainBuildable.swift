public protocol UserDomainBuildable {
    var userRepository: any UserRepository { get }
    var loadUserRoleUseCase: any LoadUserRoleUseCase { get }
    var saveUserRoleUseCase: any SaveUserRoleUseCase { get }
    var fetchMyMiniProfileUseCase: any FetchMyMiniProfileUseCase { get }
    var fetchMyProfileUseCase: any FetchMyProfileUseCase { get }
}
