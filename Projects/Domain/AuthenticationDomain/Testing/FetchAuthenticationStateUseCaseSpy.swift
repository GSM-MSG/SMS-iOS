import AuthenticationDomainInterface

public final class FetchAuthenticationStateUseCaseSpy: FetchAuthenticationStateUseCase {
    public var callCount = 0
    public var handler: (() async throws -> AuthenticationStateEntity)? = {
        return AuthenticationStateEntity(name: "ASDFsa", score: 0, grader: nil, markingBoardType: .notSubmitted)
    }

    public init() {}

    public func execute() async throws -> AuthenticationStateEntity {
        guard let handler else { fatalError() }
        return try await handler()
    }
}
