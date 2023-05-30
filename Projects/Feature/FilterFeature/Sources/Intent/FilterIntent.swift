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
}
