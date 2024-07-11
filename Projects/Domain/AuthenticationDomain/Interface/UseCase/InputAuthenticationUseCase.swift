import Foundation

public protocol InputAuthenticationUseCase {
    func execute(req: InputAuthenticationRequestDTO) async throws
}
