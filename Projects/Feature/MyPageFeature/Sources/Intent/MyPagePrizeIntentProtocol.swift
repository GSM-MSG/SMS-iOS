import Foundation

protocol MyPagePrizeIntentProtocol {
    func prizeToggleButtonDidTap(index: Int)
    func prizeRemoveButtonDidTap(index: Int)
    func updatePrizeName(index: Int, name: String)
    func updatePrizePrize(index: Int, prize: String)
    func updatePrizePrizeAt(index: Int, prizeAt: Date)
    func prizePrizeAtDidSelect(index: Int, prizeAt: Date)
    func appendEmptyPrize()
    func removePrize(index: Int)
    func prizeAtButtonDidTap(index: Int)
    func prizeAtDismissed()
    func prizeAppendButtonDidTap()
}

extension MyPageIntent: MyPagePrizeIntentProtocol {
    func prizeToggleButtonDidTap(index: Int) {
        model?.toggleCollapsedPrize(index: index)
    }

    func updatePrizeName(index: Int, name: String) {
        model?.updatePrizeName(index: index, name: name)
    }

    func updatePrizePrize(index: Int, prize: String) {
        model?.updatePrizePrize(index: index, prize: prize)
    }

    func updatePrizePrizeAt(index: Int, prizeAt: Date) {
        model?.updatePrizePrizeAt(index: index, prizeAt: prizeAt)
    }

    func prizePrizeAtDidSelect(index: Int, prizeAt: Date) {
        model?.updatePrizePrizeAt(index: index, prizeAt: prizeAt)
    }

    func prizeRemoveButtonDidTap(index: Int) {
        model?.removePrize(index: index)
    }

    func appendEmptyPrize() {
        model?.appendEmptyPrize()
    }

    func removePrize(index: Int) {
        model?.removePrize(index: index)
    }

    func prizeAtButtonDidTap(index: Int) {
        model?.updateFocusedPrizeIndex(index: index)
        model?.updateIsPresentedPrizeAtDatePicker(isPresented: true)
    }

    func prizeAtDismissed() {
        model?.updateIsPresentedPrizeAtDatePicker(isPresented: false)
    }

    func prizeAppendButtonDidTap() {
        model?.appendEmptyPrize()
    }
}
