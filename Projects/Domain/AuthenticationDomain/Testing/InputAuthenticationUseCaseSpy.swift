import AuthenticationDomainInterface

public final class InputAuthenticationUseCaseSpy: InputAuthenticationUseCase {
    public var callCount = 0
    public var handler: ((InputAuthenticationRequestDTO) async throws -> Void)?

    public init() {}

    public func execute(req: InputAuthenticationRequestDTO) async throws {
        callCount += 1
        try await handler?(req)
    }
}
