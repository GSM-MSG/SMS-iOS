import AuthDomainInterface
import SwiftUI
import SigninFeatureInterface
import BaseFeature
import NeedleFoundation

public protocol SigninDependency: Dependency {
    var loginUseCase: any LoginUseCase { get }
}

public final class SigninFactoryImpl: Component<SigninDependency>, SigninFactory {
    public func makeView() -> some View {
        let model = SigninModel()
        let intent = SigninIntent(
            loginUseCase: dependency.loginUseCase,
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
