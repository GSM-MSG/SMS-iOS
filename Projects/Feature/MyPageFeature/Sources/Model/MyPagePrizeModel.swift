import Foundation
import DateUtil

struct PrizeModel: Equatable {
    var name: String
    var prize: String
    var prizeAt: Date

    var prizeAtString: String {
        prizeAt.toStringCustomFormat(format: "yyyy.MM")
    }
}

enum MyPagePrizeInfoErrorField: Hashable {
    case name
    case type
    case date
}

protocol MyPagePrizeStateProtocol {
    var prizeList: [PrizeModel] { get }
    var collapsedPrize: [Bool] { get }
    var isPresentedPrizeAtDatePicker: Bool { get }
    var focusedPrizeIndex: Int { get }
    var prizeErrorSetList: [Set<MyPagePrizeInfoErrorField>] { get }
}

protocol MyPagePrizeActionProtocol: AnyObject {
    func toggleCollapsedPrize(index: Int)
    func updatePrizeList(prizeList: [PrizeModel])
    func updatePrizeName(index: Int, name: String)
    func updatePrizePrize(index: Int, prize: String)
    func updatePrizePrizeAt(index: Int, prizeAt: Date)
    func appendEmptyPrize()
    func removePrize(index: Int)
    func updateFocusedPrizeIndex(index: Int)
    func updateIsPresentedPrizeAtDatePicker(isPresented: Bool)
    func updatePrizeErrorSetList(set: [Set<MyPagePrizeInfoErrorField>])
}

extension MyPageModel: MyPagePrizeActionProtocol {
    func toggleCollapsedPrize(index: Int) {
        guard collapsedPrize[safe: index] != nil else { return }
        self.collapsedPrize[index].toggle()
    }

    func updatePrizeList(prizeList: [PrizeModel]) {
        self.prizeList = prizeList
    }

    func updatePrizeName(index: Int, name: String) {
        guard prizeList[safe: index] != nil else { return }
        self.prizeList[index].name = name
    }

    func updatePrizePrize(index: Int, prize: String) {
        guard prizeList[safe: index] != nil else { return }
        self.prizeList[index].prize = prize
    }

    func updatePrizePrizeAt(index: Int, prizeAt: Date) {
        guard prizeList[safe: index] != nil else { return }
        self.prizeList[index].prizeAt = prizeAt
    }

    func appendEmptyPrize() {
        let newPrize = PrizeModel(
            name: "",
            prize: "",
            prizeAt: Date()
        )
        self.prizeList.append(newPrize)
        self.collapsedPrize.append(false)
    }

    func removePrize(index: Int) {
        guard prizeList[safe: index] != nil, collapsedPrize[safe: index] != nil else { return }
        self.prizeList.remove(at: index)
        self.collapsedPrize.remove(at: index)
    }

    func updateFocusedPrizeIndex(index: Int) {
        self.focusedPrizeIndex = index
    }

    func updateIsPresentedPrizeAtDatePicker(isPresented: Bool) {
        self.isPresentedPrizeAtDatePicker = isPresented
    }

    func updatePrizeErrorSetList(set: [Set<MyPagePrizeInfoErrorField>]) {
        self.prizeErrorSetList = set
    }
}
