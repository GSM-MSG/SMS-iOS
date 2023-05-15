import BaseFeature
import InputSchoolLifeInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputSchoolLifeInfoDependency: Dependency {}

public final class InputSchoolLifeInfoComponent:
    Component<InputSchoolLifeInfoDependency>,
    InputSchoolListInfoBuildable {

    public func makeView() -> some View {
        let model = InputSchoolLifeInfoModel()
        let intent = InputSchoolLifeInfoIntent()
        let container = MVIContainer(
            intent: intent as InputSchoolLifeInfoIntentProtocol,
            model: model as InputSchoolLifeInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputSchoolLifeInfoView(container: container)
    }
}
