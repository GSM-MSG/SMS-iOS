import Foundation

public struct PortfolioLinkEntity: Equatable {
    public let token: String

    public init(token: String) {
        self.token = token
    }
}
