import BaseFeature
import MyPageFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol MyPageDependency: Dependency {}

public final class MyPageComponent: Component<MyPageDependency>, MyPageBuildable {
    public func makeView() -> some View {
        let model = MyPageModel()
        let intent = MyPageIntent(model: model)
        let container = MVIContainer(
            intent: intent as MyPageIntentProtocol,
            model: model as MyPageStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return MyPageView(container: container)
    }
}
