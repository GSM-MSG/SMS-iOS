import AuthDomainInterface
import BaseFeature
import MyPageFeatureInterface
import NeedleFoundation
import SwiftUI
import UserDomainInterface
import TechStackAppendFeatureInterface

public protocol MyPageDependency: Dependency {
    var userDomainBuildable: any UserDomainBuildable { get }
    var authDomainBuildable: any AuthDomainBuildable { get }
    var techStackAppendBuildable: any TechStackAppendBuildable { get }
}

public final class MyPageComponent: Component<MyPageDependency>, MyPageBuildable {
    public func makeView(delegate: any MyPageDelegate) -> some View {
        let model = MyPageModel()
        let intent = MyPageIntent(
            model: model,
            myPageDelegate: delegate,
            fetchMyProfileUseCase: dependency.userDomainBuildable.fetchMyProfileUseCase,
            logoutUseCase: dependency.authDomainBuildable.logoutUseCase,
            withdrawalUseCase: dependency.authDomainBuildable.withdrawalUseCase
        )
        let container = MVIContainer(
            intent: intent as MyPageIntentProtocol,
            model: model as MyPageStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return MyPageView(
            container: container,
            techStackAppendBuildable: dependency.techStackAppendBuildable
        )
    }
}
