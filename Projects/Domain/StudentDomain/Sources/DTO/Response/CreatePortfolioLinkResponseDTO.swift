import Foundation
import StudentDomainInterface

public struct CreatePortfolioLinkResponseDTO: Decodable {
    public let token: String
}

public extension CreatePortfolioLinkResponseDTO {
    func toDomain() -> PortfolioLinkEntity {
        PortfolioLinkEntity(
            token: token
        )
    }
}
