import BaseFeature
import NeedleFoundation
import SwiftUI
import SigninFeatureInterface
import InputInformationFeatureInterface
import FilterFeatureInterface

public protocol RootDependency: Dependency {
    var signinBuildable: any SigninBuildable { get }
    var inputInformationBuildable: any InputInformationBuildable { get }
    var filterBuildable: any FilterBuildable { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        let model = RootModel()
        let intent = RootIntent(model: model)
        let container = MVIContainer(
            intent: intent as RootIntentProtocol,
            model: model as RootStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return RootView(
            signinBuildable: dependency.signinBuildable,
            inputInformationBuildable: dependency.inputInformationBuildable,
            filterBuildable: dependency.filterBuildable,
            container: container
        )
    }
}
