public protocol AuthDomainBuildable {
    var loginUseCase: any LoginUseCase { get }
    var logoutUseCase: any LogoutUseCase { get }
    var withdrawalUseCase: any WithdrawalUseCase { get }
    var checkIsLoggedInUseCase: any CheckIsLoggedInUseCase { get }
    var authRepository: any AuthRepository { get }
}
