import JwtStoreInterface
import KeychainModuleInterface

struct KeychainJwtStore: JwtStore {
    private let keychain: any Keychain

    init(keychain: any Keychain) {
        self.keychain = keychain
    }

    func save(property: JwtStoreProperty, value: String) {
        self.keychain.save(key: property.rawValue, value: value)
    }

    func load(property: JwtStoreProperty) -> String {
        self.keychain.load(key: property.rawValue)
    }

    func delete(property: JwtStoreProperty) {
        self.keychain.delete(key: property.rawValue)
    }
}
