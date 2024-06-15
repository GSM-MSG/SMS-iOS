import NeedleFoundation
import AuthenticationDomainInterface
import JwtStoreInterface

public protocol AuthenticationDomainDependency: Dependency {
    var jwtStoreBuildable: any JwtStoreBuildable { get }
}

public final class AuthenticationDomainComponent: Component<AuthenticationDomainDependency>, AuthenticationDomainBuildable {
    public var inputAuthenticationUseCase: any InputAuthenticationUseCase {
        InputAuthenticationUseCaseImpl(authenticationRepository: authenticationRepository)
    }

    public var fetchAuthenticationFormUseCase: any FetchAuthenticationFormUseCase {
        FetchAuthenticationFormUseCaseImpl(authenticationRepository: authenticationRepository)
    }
    public var authenticationRepository: any AuthenticationRepository {
        AuthenticationRepositoryImpl(remoteAuthenticationDataSource: remoteAuthenticationDataSource)
    }
    var remoteAuthenticationDataSource: any RemoteAuthenticationDataSource {
        RemoteAuthenticationDataSourceImpl(jwtStore: dependency.jwtStoreBuildable.jwtStore)
    }
}
