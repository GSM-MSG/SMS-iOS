import Foundation
import FoundationUtil

final class InputPrizeInfoModel: ObservableObject, InputPrizeInfoStateProtocol {
    @Published var prizeList: [PrizeInfo] = []
    @Published var collapsedPrize: [Bool] = []
    @Published var prizeErrorSetList: [Set<InputPrizeInfoErrorField>] = []
    @Published var isPresentedPrizeAtDatePicker: Bool = false
    var focusedPrizeIndex: Int = 0
}

extension InputPrizeInfoModel: InputPrizeInfoActionProtocol {
    func toggleCollapsedPrize(index: Int) {
        guard collapsedPrize[safe: index] != nil else { return }
        self.collapsedPrize[index].toggle()
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
        let newPrize = PrizeInfo(
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

    func updateErrorSetList(set: [Set<InputPrizeInfoErrorField>]) {
        self.prizeErrorSetList = set
    }
}
