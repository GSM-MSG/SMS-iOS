import SwiftUI
import FilterFeatureInterface
import BaseFeature
import NeedleFoundation

public protocol FilterDependency: Dependency {
}

public final class FilterComponent: Component<FilterDependency>, FilterBuildable {
    public func makeView(delegate: any FilterDelegate) -> some View {
        let model = FilterModel()
        let intent = FilterIntent(
            model: model,
            filterDelegate: delegate
        )
        let container = MVIContainer(
            intent: intent as FilterIntentProtocol,
            model: model as FilterStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return FilterView(container: container)
    }
}
