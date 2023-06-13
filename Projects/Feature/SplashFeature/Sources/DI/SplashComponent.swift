import AuthDomainInterface
import BaseFeature
import NeedleFoundation
import SplashFeatureInterface
import SwiftUI

public protocol SplashDependency: Dependency {
    var authDomainBuildable: any AuthDomainBuildable { get }
}

public final class SplashComponent: Component<SplashDependency>, SplashBuildable {
    public func makeView() -> some View {
        let model = SplashModel()
        let intent = SplashIntent(
            model: model
        )
        let container = MVIContainer(
            intent: intent as SplashIntentProtocol,
            model: model as SplashStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return SplashView(container: container)
    }
}
