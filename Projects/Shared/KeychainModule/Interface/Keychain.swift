public protocol Keychain {
    func save(key: String, value: String)
    func load(key: String) -> String
    func delete(key: String)
}
