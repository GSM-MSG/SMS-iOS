import BaseFeature
import FilterFeatureInterface
import MajorDomainInterface
import NeedleFoundation
import SwiftUI
import TechStackAppendFeatureInterface
import UserDomainInterface

public protocol FilterDependency: Dependency {
    var techStackAppendBuildable: any TechStackAppendBuildable { get }
    var majorDomainBuildable: any MajorDomainBuildable { get }
    var userDomainBuildable: any UserDomainBuildable { get }
}

public final class FilterComponent: Component<FilterDependency>, FilterBuildable {
    public func makeView(delegate: any FilterDelegate) -> some View {
        let model = FilterModel()
        let intent = FilterIntent(
            model: model,
            filterDelegate: delegate,
            fetchMajorListUseCase: dependency.majorDomainBuildable.fetchMajorListUseCase,
            loadUserRoleUseCase: dependency.userDomainBuildable.loadUserRoleUseCase
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
