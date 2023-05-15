import BaseFeature
import InputInformationFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputInformationDependency: Dependency {}

public final class InputInformationComponent:
    Component<InputInformationDependency>,
    InputInformationBuildable {

    public func makeView() -> some View {
        let model = InputInformationModel()
        let intent = InputInformationIntent(model: model)
        let container = MVIContainer(
            intent: intent as InputInformationIntentProtocol,
            model: model as InputInformationStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputInformationView(container: container)
    }
}
