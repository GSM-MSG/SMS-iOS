import NeedleFoundation
import UserDomainInterface

public protocol UserDomainDependency: Dependency {}

public final class UserDomainComponent: Component<UserDomainDependency>, UserDomainBuildable {
    public var saveUserRoleUseCase: any SaveUserRoleUseCase {
        SaveUserRoleUseCaseImpl(userRepository: userRepository)
    }
    public var loadUserRoleUseCase: any LoadUserRoleUseCase {
        LoadUserRoleUseCaseImpl(userRepository: userRepository)
    }
    public var userRepository: any UserRepository {
        UserRepositoryImpl(localUserDataSource: localUserDataSource)
    }
    var localUserDataSource: any LocalUserDataSource {
        LocalUserDataSourceImpl(userDefaults: .standard)
    }
}
