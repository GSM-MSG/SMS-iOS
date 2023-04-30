import NeedleFoundation
import AuthDomainInterface
import JwtStoreInterface

public protocol AuthDomainDependency: Dependency {
    var jwtStoreComponentProtocol: any JwtStoreComponentProtocol { get }
}

public final class AuthDomainComponent: Component<AuthDomainDependency>, AuthDomainComponentProtocol {
    public var loginUseCase: any LoginUseCase {
        LoginUseCaseImpl(authRepository: authRepository)
    }
    public var authRepository: any AuthRepository {
        AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDataSource)
    }
    var remoteAuthDataSource: any RemoteAuthDataSource {
        RemoteAuthDataSourceImpl(jwtStore: dependency.jwtStoreComponentProtocol.jwtStore)
    }
}
