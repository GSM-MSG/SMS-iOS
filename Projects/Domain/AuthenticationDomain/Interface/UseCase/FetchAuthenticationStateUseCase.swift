import Foundation

public protocol FetchAuthenticationStateUseCase {
    func execute() async throws -> AuthenticationStateEntity
}
