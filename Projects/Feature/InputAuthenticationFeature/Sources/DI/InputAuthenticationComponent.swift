import BaseFeature
import InputAuthenticationFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputAuthenticationDependency: Dependency {}

public final class InputAuthenticationComponent: Component<InputAuthenticationDependency>, InputAuthenticationBuildable {
    public func makeView(delegate: InputAuthenticationDelegate) -> some View {
        let model = InputAuthenticationModel()
        let intent = InputAuthenticationIntent(model: model, inputAuthenticationDelegate: delegate)
        let container = MVIContainer(
            intent: intent as InputAuthenticationIntentProtocol,
            model: model as InputAuthenticationStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputAuthenticationView(container: container)
    }
}
