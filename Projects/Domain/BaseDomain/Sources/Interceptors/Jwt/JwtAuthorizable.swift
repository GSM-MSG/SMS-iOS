public enum JwtTokenType: String {
    case accessToken = "Authorization"
    case refreshToken = "Refresh-token"
    case none
}

public protocol JwtAuthorizable {
    var jwtTokenType: JwtTokenType { get }
}
