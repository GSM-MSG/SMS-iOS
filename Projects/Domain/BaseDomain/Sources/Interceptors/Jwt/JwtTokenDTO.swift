struct JwtTokenDTO: Decodable {
    let accessToken: String
    let refreshToken: String
    let accessExpiresAt: String
    let refreshExpiresAt: String

    enum CodingKeys: String, CodingKey {
        case accessToken, refreshToken
        case accessExpiresAt = "accessTokenExp"
        case refreshExpiresAt = "refreshTokenExp"
    }
}
