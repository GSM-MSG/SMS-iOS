import BaseFeature
import MyPageFeatureInterface
import NeedleFoundation
import SwiftUI
import UserDomainInterface

public protocol MyPageDependency: Dependency {
    var fetchMyProfileUseCase: any FetchMyProfileUseCase { get }
}

public final class MyPageComponent: Component<MyPageDependency>, MyPageBuildable {
    public func makeView() -> some View {
        let model = MyPageModel()
        let intent = MyPageIntent(
            model: model,
            fetchMyProfileUseCase: dependency.fetchMyProfileUseCase
        )
        let container = MVIContainer(
            intent: intent as MyPageIntentProtocol,
            model: model as MyPageStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return MyPageView(container: container)
    }
}
