import NeedleFoundation
import AuthDomainInterface
import JwtStoreInterface

public protocol AuthDomainDependency: Dependency {
    var jwtStoreComponentProtocol: any JwtStoreComponentProtocol { get }
}

public final class AuthDomainComponent: Component<AuthDomainDependency>, AuthDomainComponentProtocol {
    public var loginUseCase: LoginUseCase {
        LoginUseCaseImpl(authRepository: authRepository)
    }
    public var authRepository: AuthRepository {
        AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDataSource)
    }
    var remoteAuthDataSource: RemoteAuthDataSource {
        RemoteAuthDataSourceImpl(jwtStore: dependency.jwtStoreComponentProtocol.jwtStore)
    }
}
