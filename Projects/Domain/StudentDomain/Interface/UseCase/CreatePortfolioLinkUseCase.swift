import Foundation

public protocol CreatePortfolioLinkUseCase {
    func execute(req: CreatePortfolioLinkRequestDTO) async throws -> PortfolioLinkEntity
}
