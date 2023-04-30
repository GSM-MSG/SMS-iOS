import JwtStoreInterface
import KeychainModuleInterface
import NeedleFoundation

public protocol JwtStoreDependency: Dependency {
    var keychainComponentProtocol: any KeychainComponentProtocol { get }
}

public final class JwtStoreComponent: Component<JwtStoreDependency>, JwtStoreComponentProtocol {
    public var jwtStore: any JwtStore {
        KeychainJwtStore(keychain: dependency.keychainComponentProtocol.keychain)
    }
}
