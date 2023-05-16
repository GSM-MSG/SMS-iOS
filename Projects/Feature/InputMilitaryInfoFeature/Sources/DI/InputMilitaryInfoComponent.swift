import BaseFeature
import InputMilitaryInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputMilitaryInfoDependency: Dependency {}

public final class InputMilitaryInfoComponent:
    Component<InputMilitaryInfoDependency>,
    InputMilitaryInfoBuildable {

    public func makeView() -> some View {
        let model = InputMilitaryInfoModel()
        let intent = InputMilitaryInfoIntent(model: model)
        let container = MVIContainer(
            intent: intent as InputMilitaryInfoIntentProtocol,
            model: model as InputMilitaryInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputMilitaryInfoView(container: container)
    }
}
