import AuthDomainInterface
import SwiftUI
import SigninFeatureInterface
import BaseFeature
import NeedleFoundation

public protocol SigninDependency: Dependency {
    var authDomainBuildable: any AuthDomainBuildable { get }
}

public final class SigninComponent: Component<SigninDependency>, SigninBuildable {
    public func makeView(delegate: any SigninDelegate) -> some View {
        let model = SigninModel()
        let intent = SigninIntent(
            model: model,
            signinDelegate: delegate,
            loginUseCase: dependency.authDomainBuildable.loginUseCase
        )
        let container = MVIContainer(
            intent: intent as SigninIntentProtocol,
            model: model as SigninStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return SigninView(container: container)
    }
}
