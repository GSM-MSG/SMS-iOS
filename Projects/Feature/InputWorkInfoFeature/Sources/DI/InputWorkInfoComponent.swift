import BaseFeature
import InputWorkInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputWorkInfoDependency: Dependency {}

public final class InputWorkInfoComponent:
    Component<InputWorkInfoDependency>,
    InputWorkInfoBuildable {

    public func makeView(delegate: InputWorkDelegate) -> some View {
        let model = InputWorkInfoModel()
        let intent = InputWorkInfoIntent(model: model, inputWorkDelegate: delegate)
        let container = MVIContainer(
            intent: intent as InputWorkInfoIntentProtocol,
            model: model as InputWorkInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputWorkInfoView(container: container)
    }
}
