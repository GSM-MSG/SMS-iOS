import Foundation
import InputPrizeInfoFeatureInterface
import FoundationUtil

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

    func completeButtonDidTap(prizes: [PrizeInfo]) {
        var errorSet: [Set<InputPrizeInfoErrorField>] = []

        let prizeInfoObjects = prizes
            .enumerated()
            .map { index, prize in
                errorSet.append([])

                if prize.name.isEmpty, errorSet[safe: index] != nil {
                    errorSet[index].insert(.name)
                }

                if prize.prize.isEmpty, errorSet[safe: index] != nil {
                    errorSet[index].insert(.type)
                }

                if prize.prizeAt.description.isEmpty, errorSet[safe: index] != nil {
                    errorSet[index].insert(.date)
                }

                return InputPrizeInfoObject(
                    name: prize.name,
                    prize: prize.prize,
                    prizeAt: prize.prizeAt
                )
            }
        model?.updateErrorSetList(set: errorSet)
        guard !errorSet.contains(where: { $0.isNotEmpty }) else { return }

        delegate?.completeToInputPrizeInfo(input: prizeInfoObjects)
    }

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
