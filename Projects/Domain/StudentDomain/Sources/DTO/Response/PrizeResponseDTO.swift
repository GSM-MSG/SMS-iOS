import Foundation
import StudentDomainInterface

public struct PrizeResponseDTO: Decodable {
    public let name: String
    public let type: String
    public let date: String
}

extension PrizeResponseDTO {
    func toDomain() -> PrizeEntity {
        PrizeEntity(name: name, type: type, date: date)
    }
}
