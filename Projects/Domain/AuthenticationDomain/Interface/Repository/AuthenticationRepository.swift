import Foundation

public protocol AuthenticationRepository {
    func fetchAuthenticationForm(uuid: String) async throws -> AuthenticationFormEntity
    func inputAuthentication(uuid: String, req: InputAuthenticationRequestDTO) async throws
}
