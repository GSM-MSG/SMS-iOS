import Foundation

public protocol InputAuthenticationUseCase {
    func execute(uuid: String, req: InputAuthenticationRequestDTO) async throws
}
