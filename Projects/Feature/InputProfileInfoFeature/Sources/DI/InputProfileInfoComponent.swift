import BaseFeature
import InputProfileInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputProfileInfoDependency: Dependency {}

public final class InputProfileInfoComponent:
    Component<InputProfileInfoDependency>,
    InputProfileInfoBuildable {

    public func makeView(delegate: InputProfileDelegate) -> some View {
        let model = InputProfileInfoModel()
        let intent = InputProfileInfoIntent(model: model, inputProfileDelegate: delegate)
        let container = MVIContainer(
            intent: intent as InputProfileInfoIntentProtocol,
            model: model as InputProfileInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputProfileInfoView(container: container)
    }
}
