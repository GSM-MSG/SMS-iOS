import BaseFeature
import InputTeacherInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputTeacherInfoDependency: Dependency {
    
}

public final class InputTeacherInfoComponent: Component<InputTeacherInfoDependency>, InputTeacherInfoBuildable {

    public func makeView() -> some View {
        let model = InputTeacherInfoModel()
        let intent = InputTeacherInfoIntent(model: model)
        let container = MVIContainer(
            intent: intent as InputTeacherInfoIntentProtocol,
            model: model as InputTeacherInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputTeacherInfoView(container: container)
    }
}
