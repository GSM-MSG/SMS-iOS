import NeedleFoundation
import UserDomainInterface
import JwtStoreInterface

public protocol UserDomainDependency: Dependency {
    var jwtStoreBuildable: any JwtStoreBuildable { get }
}

public final class UserDomainComponent: Component<UserDomainDependency>, UserDomainBuildable {
    public var saveUserRoleUseCase: any SaveUserRoleUseCase {
        SaveUserRoleUseCaseImpl(userRepository: userRepository)
    }
    public var loadUserRoleUseCase: any LoadUserRoleUseCase {
        LoadUserRoleUseCaseImpl(userRepository: userRepository)
    }
    public var fetchMyMiniProfileUseCase: any FetchMyMiniProfileUseCase {
        FetchMyMiniProfileUseCaseImpl(userRepository: userRepository)
    }
    public var fetchMyProfileUseCase: FetchMyProfileUseCase {
        FetchMyProfileUseCaseImpl(userRepository: userRepository)
    }
    public var userRepository: any UserRepository {
        UserRepositoryImpl(
            localUserDataSource: localUserDataSource,
            remoteUserDataSource: remoteUserDataSource
        )
    }
    var localUserDataSource: any LocalUserDataSource {
        LocalUserDataSourceImpl(userDefaults: .standard)
    }
    var remoteUserDataSource: any RemoteUserDataSource {
        RemoteUserDataSourceImpl(jwtStore: dependency.jwtStoreBuildable.jwtStore)
    }
}
