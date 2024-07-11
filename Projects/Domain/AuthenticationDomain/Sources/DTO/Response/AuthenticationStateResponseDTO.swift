import Foundation
import AuthenticationDomainInterface

public struct AuthenticationStateResponseDTO: Decodable {
    public let name: String
    public let score: Double
    public let grader: String?
    public let markingBoardType: MarkingBoardType

    public init(name: String, score: Double, grader: String?, markingBoardType: MarkingBoardType) {
        self.name = name
        self.score = score
        self.grader = grader
        self.markingBoardType = markingBoardType
    }
}

extension AuthenticationStateResponseDTO {
    func toDomain() -> AuthenticationStateEntity {
        AuthenticationStateEntity(
            name: name,
            score: score,
            grader: grader,
            markingBoardType: markingBoardType
        )
    }
}
