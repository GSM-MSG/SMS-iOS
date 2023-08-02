import Foundation
import InputPrizeInfoFeatureInterface

final class InputPrizeInfoIntent: InputPrizeInfoIntentProtocol {
    private weak var model: (any InputPrizeInfoActionProtocol)?
    private weak var delegate: (any InputPrizeDelegate)?

    init(
        model: any InputPrizeInfoActionProtocol,
        delegate: any InputPrizeDelegate
    ) {
        self.model = model
        self.delegate = delegate
    }

    func prevButtonDidTap() {
        delegate?.prizeInfoPrevButtonDidTap()
    }

    func nextButtonDidTap(prizes: [PrizeInfo]) {
        let prizeInfoObjects = prizes.map {
            return InputPrizeInfoObject(
                name: $0.name,
                prize: $0.prize,
                prizeAt: $0.prizeAt
            )
        }
        delegate?.completeToInputPrizeInfo(input: prizeInfoObjects)
    }

    func prizeToggleButtonDidTap(index: Int) {
        model?.toggleCollapsedProject(index: index)
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
