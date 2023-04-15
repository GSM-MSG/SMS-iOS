import JwtStoreInterface

final class FakeJwtStore: JwtStore {
    private var store: [String: String] = [:]

    func save(property: JwtStoreProperty, value: String) {
        store[property.rawValue] = value
    }

    func load(property: JwtStoreProperty) -> String {
        store[property.rawValue] ?? ""
    }

    func delete(property: JwtStoreProperty) {
        store.removeValue(forKey: property.rawValue)
    }
}
