import Foundation
import StudentDomainInterface
import DateUtil

public protocol InputPrizeDelegate: AnyObject {
    func prizeInfoPrevButtonDidTap()
    func completeToInputPrizeInfo(input: [InputPrizeInfoObject])
}

public struct InputPrizeInfoObject {
    public let name: String
    public let prize: String
    public let prizeAt: Date

    public init(
        name: String,
        prize: String,
        prizeAt: Date
    ) {
        self.name = name
        self.prize = prize
        self.prizeAt = prizeAt
    }
}
