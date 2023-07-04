import Combine
import FilterFeatureInterface

final class FilterIntent: FilterIntentProtocol {
    private weak var model: (any FilterActionProtocol)?
    private weak var filterDelegate: (any FilterDelegate)?

    init(
        model: any FilterActionProtocol,
        filterDelegate: any FilterDelegate
    ) {
        self.filterDelegate = filterDelegate
        self.model = model
    }

    func techStackAppendIsRequired() {
        model?.updateIsPresentedTeckStackAppend(isPresented: true)
    }

    func techStackAppendDismissed() {
        model?.updateIsPresentedTeckStackAppend(isPresented: false)
    }

    func techStackAppendDidComplete(techStacks: [String]) {
        model?.updateTeckStacks(techStacks: techStacks)
    }
}
