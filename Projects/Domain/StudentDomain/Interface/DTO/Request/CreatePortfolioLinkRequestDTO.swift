import Foundation

public struct CreatePortfolioLinkRequestDTO: Encodable {
    public let studentId: String
    public let periodDay: Int

    public init(
        studentId: String,
        periodDay: Int
    ) {
        self.studentId = studentId
        self.periodDay = periodDay
    }
}
