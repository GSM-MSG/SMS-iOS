import Foundation

public protocol AuthenticationRepository {
    func fetchAuthenticationForm() async throws -> AuthenticationFormEntity
    func inputAuthentication(req: InputAuthenticationRequestDTO) async throws
    func fetchAuthenticationState() async throws -> AuthenticationStateEntity
}
