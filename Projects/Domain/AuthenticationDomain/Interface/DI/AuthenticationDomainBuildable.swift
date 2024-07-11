public protocol AuthenticationDomainBuildable {
    var fetchAuthenticationFormUseCase: any FetchAuthenticationFormUseCase { get }
    var inputAuthenticationUseCase: any InputAuthenticationUseCase { get }
    var fetchAuthenticationStateUseCase: any FetchAuthenticationStateUseCase { get }
}
