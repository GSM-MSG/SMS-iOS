import AuthDomainInterface
import BaseFeature
import NeedleFoundation
import SplashFeatureInterface
import SwiftUI

public protocol SplashDependency: Dependency {
    var authDomainBuildable: any AuthDomainBuildable { get }
}

public final class SplashComponent: Component<SplashDependency>, SplashBuildable {
    public func makeView(delegate: SplashDelegate) -> some View {
        let model = SplashModel()
        let intent = SplashIntent(
            model: model,
            splashDelegate: delegate,
            checkIsLoggedInUseCase: dependency.authDomainBuildable.checkIsLoggedInUseCase
        )
        let container = MVIContainer(
            intent: intent as SplashIntentProtocol,
            model: model as SplashStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return SplashView(container: container)
    }
}
