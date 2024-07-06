import Foundation

public struct CreatePortfolioLinkRequestDTO: Encodable {
    public let studentID: String
    public let periodDay: Int

    public init(
        studentID: String,
        periodDay: Int
    ) {
        self.studentID = studentID
        self.periodDay = periodDay
    }
    
    enum CodingKeys: String, CodingKey {
        case studentID = "studentId"
        case periodDay
    }
}
