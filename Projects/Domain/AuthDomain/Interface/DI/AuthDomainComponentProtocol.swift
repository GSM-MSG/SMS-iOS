public protocol AuthDomainComponentProtocol {
    var loginUseCase: any LoginUseCase { get }
    var authRepository: any AuthRepository { get }
}
