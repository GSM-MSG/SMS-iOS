import BaseFeature
import InputLanguageInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputLanguageInfoDependency: Dependency {}

public final class InputLanguageInfoComponent:
    Component<InputLanguageInfoDependency>,
    InputLanguageInfoBuildable {

    public func makeView(delegate: InputLanguageDelegate) -> some View {
        let model = InputLanguageInfoModel()
        let intent = InputLanguageInfoIntent(model: model, languageDelegate: delegate)
        let container = MVIContainer(
            intent: intent as InputLanguageInfoIntentProtocol,
            model: model as InputLanguageInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputLanguageInfoView(container: container)
    }
}
