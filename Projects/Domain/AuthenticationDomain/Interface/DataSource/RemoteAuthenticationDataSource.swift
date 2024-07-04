import Foundation

public protocol RemoteAuthenticationDataSource {
    func fetchAuthenticationForm() async throws -> AuthenticationFormEntity

    func inputAuthentication(req: InputAuthenticationRequestDTO) async throws
}
