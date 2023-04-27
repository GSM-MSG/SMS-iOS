import AuthDomainInterface

struct AuthRepositoryMock: AuthRepository {
    func login(code: String) async throws {
        if code.isEmpty {
            throw AuthDomainError.invalidGAuthCode
        }
    }
}
