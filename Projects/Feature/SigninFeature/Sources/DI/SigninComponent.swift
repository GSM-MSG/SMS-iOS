import AuthDomainInterface
import SwiftUI
import SigninFeatureInterface
import BaseFeature
import NeedleFoundation

public protocol SigninDependency: Dependency {
    var authDomainComponentProtocol: any AuthDomainComponentProtocol { get }
}

public final class SigninComponent: Component<SigninDependency>, SigninComponentProtocol {
    public func makeView() -> some View {
        let model = SigninModel()
        let intent = SigninIntent(
            loginUseCase: dependency.authDomainComponentProtocol.loginUseCase,
            model: model
        )
        let container = MVIContainer(
            intent: intent as SigninIntentProtocol,
            model: model as SigninStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return SigninView(container: container)
    }
}
