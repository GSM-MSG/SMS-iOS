import BaseFeature
import InputInformationFeatureInterface
import MainFeatureInterface
import NeedleFoundation
import SigninFeatureInterface
import SplashFeatureInterface
import SwiftUI
import FilterFeatureInterface

public protocol RootDependency: Dependency {
    var signinBuildable: any SigninBuildable { get }
    var inputInformationBuildable: any InputInformationBuildable { get }
    var mainBuildable: any MainBuildable { get }
    var filterBuildable: any FilterBuildable { get }
    var splashBuildable: any SplashBuildable { get }
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
            mainBuildable: dependency.mainBuildable,
            filterBuildable: dependency.filterBuildable,
            splashBuildable: dependency.splashBuildable,
            container: container
        )
    }
}
