import BaseFeature
import NeedleFoundation
import SwiftUI
import TechStackAppendFeatureInterface

public protocol TechStackAppendDependency: Dependency {}

public final class TechStackAppendComponent: Component<TechStackAppendDependency>, TechStackAppendBuildable {
    public func makeView() -> some View {
        let model = TechStackAppendModel()
        let intent = TechStackAppendIntent(model: model)
        let container = MVIContainer(
            intent: intent as TechStackAppendIntentProtocol,
            model: model as TechStackAppendStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return TechStackAppendView(container: container)
    }
}
