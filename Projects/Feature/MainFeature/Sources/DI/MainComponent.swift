import SwiftUI
import MainFeatureInterface
import BaseFeature
import NeedleFoundation

public protocol MainDependency: Dependency {
}

public final class MainComponent: Component<MainDependency>, MainBuildable {
    public func makeView(delegate: any MainDelegate) -> some View {
        let model = MainModel()
        let intent = MainIntent(
            model: model,
            mainDelegate: delegate
        )
        let container = MVIContainer(
            intent: intent as MainIntentProtocol,
            model: model as MainStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return MainView(container: container)
    }
}
