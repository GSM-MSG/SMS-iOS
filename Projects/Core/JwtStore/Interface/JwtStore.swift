public enum JwtStoreProperty: String {
    case accessToken = "ACCESS-TOKEN"
    case refreshToken = "REFRESH-TOKEN"
    case accessExpiresAt = "ACCESS-EXPIRES-AT"
    case refreshExpiresAt = "REFRESH-EXPIRES-AT"
}

public protocol JwtStore {
    func save(property: JwtStoreProperty, value: String)
    func load(property: JwtStoreProperty) -> String
    func delete(property: JwtStoreProperty)
}
