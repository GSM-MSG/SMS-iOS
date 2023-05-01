public protocol AuthDomainBuildable {
    var loginUseCase: any LoginUseCase { get }
    var authRepository: any AuthRepository { get }
}
