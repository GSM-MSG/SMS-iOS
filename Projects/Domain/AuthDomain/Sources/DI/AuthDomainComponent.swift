import NeedleFoundation
import AuthDomainInterface
import JwtStoreInterface

public protocol AuthDomainDependency: Dependency {
    var jwtStoreBuildable: any JwtStoreBuildable { get }
}

public final class AuthDomainComponent: Component<AuthDomainDependency>, AuthDomainBuildable {
    public var loginUseCase: any LoginUseCase {
        LoginUseCaseImpl(authRepository: authRepository)
    }
    public var logoutUseCase: any LogoutUseCase {
        LogoutUseCaseImpl(authRepository: authRepository)
    }
    public var withdrawalUseCase: any WithdrawalUseCase {
        WithdrawalUseCaseImpl(authRepository: authRepository)
    }
    public var checkIsLoggedInUseCase: any CheckIsLoggedInUseCase {
        CheckIsLoggedInUseCaseImpl(authRepository: authRepository)
    }
    public var authRepository: any AuthRepository {
        AuthRepositoryImpl(
            remoteAuthDataSource: remoteAuthDataSource,
            localAuthDataSource: localAuthDataSource
        )
    }
    var remoteAuthDataSource: any RemoteAuthDataSource {
        RemoteAuthDataSourceImpl(jwtStore: dependency.jwtStoreBuildable.jwtStore)
    }
    var localAuthDataSource: any LocalAuthDataSource {
        LocalAuthDataSourceImpl(jwtStore: dependency.jwtStoreBuildable.jwtStore)
    }
}
