import StudentDomainInterface

public final class CreatePortfolioLinkUseCaseSpy: CreatePortfolioLinkUseCase {
    public init() {}

    public func execute(
        req: CreatePortfolioLinkRequestDTO
    ) async throws -> PortfolioLinkEntity {
        return .init(token: "")
    }
}
