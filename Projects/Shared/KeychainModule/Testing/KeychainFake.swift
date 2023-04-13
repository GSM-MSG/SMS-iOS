import Foundation
import KeychainModuleInterface

final class KeychainFake: Keychain {
    private var store: [String: String] = [:]

    func save(key: String, value: String) {
        store[key] = value
    }

    func load(key: String) -> String {
        store[key] ?? ""
    }

    func delete(key: String) {
        store.removeValue(forKey: key)
    }
}
