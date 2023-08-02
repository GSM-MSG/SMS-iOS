import Foundation
import DateUtil

struct PrizeInfo: Equatable {
    var name: String
    var prize: String
    var prizeAt: Date

    var prizeAtString: String {
        prizeAt.toStringCustomFormat(format: "yyyy.MM")
    }
}

protocol InputPrizeInfoStateProtocol {
    var prizeList: [PrizeInfo] { get }
    var collapsedPrize: [Bool] { get }
    var isPresentedPrizeAtDatePicker: Bool { get }
    var focusedPrizeIndex: Int { get }
}

protocol InputPrizeInfoActionProtocol: AnyObject {
    func toggleCollapsedPrize(index: Int)
    func updatePrizeName(index: Int, name: String)
    func updatePrizePrize(index: Int, prize: String)
    func updatePrizePrizeAt(index: Int, prizeAt: Date)
    func appendEmptyPrize()
    func removePrize(index: Int)
    func updateFocusedPrizeIndex(index: Int)
    func updateIsPresentedPrizeAtDatePicker(isPresented: Bool)
}
