import JwtStoreInterface
import KeychainModuleInterface
import NeedleFoundation

public protocol JwtStoreDependency: Dependency {
    var keychainBuildable: any KeychainBuildable { get }
}

public final class JwtStoreComponent: Component<JwtStoreDependency>, JwtStoreBuildable {
    public var jwtStore: any JwtStore {
        KeychainJwtStore(keychain: dependency.keychainBuildable.keychain)
    }
}
