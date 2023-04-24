import KeychainModuleInterface
import NeedleFoundation

public final class KeychainComponent: Component<EmptyDependency>, KeychainComponentProtocol {
    public var keychain: Keychain {
        DefaultKeychain()
    }
}
