import BaseFeature
import InputProjectInfoFeatureInterface
import NeedleFoundation
import SwiftUI

protocol InputProjectInfoDependency: Dependency {}

final class InputProjectInfoComponent:
    Component<InputProjectInfoDependency>,
    InputProjectInfoBuildable {
    func makeView() -> some View {
        let model = InputProjectInfoModel()
        let intent = InputProjectInfoIntent(
            model: model
        )
        let container = MVIContainer(
            intent: intent as InputProjectInfoIntentProtocol,
            model: model as InputProjectInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputProjectInfoView(container: container)
    }
}
