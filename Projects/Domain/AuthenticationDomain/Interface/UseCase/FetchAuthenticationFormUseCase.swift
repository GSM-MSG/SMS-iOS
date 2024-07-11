import Foundation

public protocol FetchAuthenticationFormUseCase {
    func execute() async throws -> AuthenticationFormEntity
}
