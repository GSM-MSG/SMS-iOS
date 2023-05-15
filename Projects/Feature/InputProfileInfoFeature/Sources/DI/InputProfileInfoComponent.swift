import BaseFeature
import InputProfileInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputProfileInfoDependency: Dependency {}

public final class InputProfileInfoComponent:
    Component<InputProfileInfoDependency>,
    InputProfileInfoBuildable {

    public func makeView() -> some View {
        let model = InputProfileInfoModel()
        let intent = InputProfileInfoIntent()
        let container = MVIContainer(
            intent: intent as InputProfileInfoIntentProtocol,
            model: model as InputProfileInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputProfileInfoView(container: container)
    }
}
