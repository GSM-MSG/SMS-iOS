import BaseFeature
import InputSchoolLifeInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputSchoolLifeInfoDependency: Dependency {}

public final class InputSchoolLifeInfoComponent:
    Component<InputSchoolLifeInfoDependency>,
    InputSchoolListInfoBuildable {

    public func makeView(delegate: any InputSchoolLifeDelegate) -> some View {
        let model = InputSchoolLifeInfoModel()
        let intent = InputSchoolLifeInfoIntent(model: model, inputSchoolLifeDelegate: delegate)
        let container = MVIContainer(
            intent: intent as InputSchoolLifeInfoIntentProtocol,
            model: model as InputSchoolLifeInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputSchoolLifeInfoView(container: container)
    }
}
