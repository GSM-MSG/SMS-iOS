import BaseFeature
import InputPrizeInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputPrizeInfoDependency: Dependency {}

public final class InputPrizeInfoComponent:
    Component<InputPrizeInfoDependency>,
    InputPrizeInfoBuildable {

    public func makeView(delegate: InputPrizeDelegate) -> some View {
        let model = InputPrizeInfoModel()
        let intent = InputPrizeInfoIntent(model: model, delegate: delegate)
        let container = MVIContainer(
            intent: intent as InputPrizeInfoIntentProtocol,
            model: model as InputPrizeInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputPrizeInfoView(container: container)
    }
}
