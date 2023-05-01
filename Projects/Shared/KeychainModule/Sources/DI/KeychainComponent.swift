import KeychainModuleInterface
import NeedleFoundation

public final class KeychainComponent: Component<EmptyDependency>, KeychainBuildable {
    public var keychain: any Keychain {
        DefaultKeychain()
    }
}
