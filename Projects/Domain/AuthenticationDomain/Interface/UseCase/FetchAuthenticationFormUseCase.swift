import Foundation

public protocol FetchAuthenticationFormUseCase {
    func execute(uuid: String) async throws -> AuthenticationFormEntity
}
