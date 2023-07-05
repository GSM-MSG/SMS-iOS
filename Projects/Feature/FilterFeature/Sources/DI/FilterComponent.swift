import SwiftUI
import FilterFeatureInterface
import TechStackAppendFeatureInterface
import BaseFeature
import MajorDomainInterface
import NeedleFoundation

public protocol FilterDependency: Dependency {
    var techStackAppendBuildable: any TechStackAppendBuildable { get }
    var majorDomainBuildable: any MajorDomainBuildable { get }
}

public final class FilterComponent: Component<FilterDependency>, FilterBuildable {
    public func makeView(delegate: any FilterDelegate) -> some View {
        let model = FilterModel()
        let intent = FilterIntent(
            model: model,
            filterDelegate: delegate,
            fetchMajorListUseCase: dependency.majorDomainBuildable.fetchMajorListUseCase
        )
        let container = MVIContainer(
            intent: intent as FilterIntentProtocol,
            model: model as FilterStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return FilterView(
            container: container,
            techStackAppendBuildable: dependency.techStackAppendBuildable
        )
    }
}
