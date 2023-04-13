import Foundation
import KeychainModuleInterface

public final class FakeKeychain: Keychain {
    public init() {}
    public var store: [String: String] = [:]

    public func save(key: String, value: String) {
        store[key] = value
    }

    public func load(key: String) -> String {
        store[key] ?? ""
    }

    public func delete(key: String) {
        store.removeValue(forKey: key)
    }
}
