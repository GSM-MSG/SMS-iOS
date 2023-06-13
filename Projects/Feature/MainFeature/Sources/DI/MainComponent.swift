import SwiftUI
import MainFeatureInterface
import StudentDomainInterface
import AuthDomainInterface
import StudentDetailFeatureInterface
import FilterFeatureInterface
import NeedleFoundation
import BaseFeature

public protocol MainDependency: Dependency {
    var studentDomainBuildable: any StudentDomainBuildable { get }
    var authDomainBuildable: any AuthDomainBuildable { get }
    var filterBuildable: any FilterBuildable { get }
    var studentDetailBuildable: any StudentDetailBuildable { get }
}

public final class MainComponent: Component<MainDependency>, MainBuildable {
    public func makeView(delegate: any MainDelegate) -> some View {
        let model = MainModel()
        let intent = MainIntent(
            model: model,
            mainDelegate: delegate,
            fetchStudentListUseCase: dependency.studentDomainBuildable.fetchStudentListUseCase,
            logoutUseCase: dependency.authDomainBuildable.logoutUseCase,
            withdrawalUseCase: dependency.authDomainBuildable.withdrawalUseCase
        )
        let container = MVIContainer(
            intent: intent as MainIntentProtocol,
            model: model as MainStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return MainView(
            container: container,
            studentDetailBuildable: dependency.studentDetailBuildable,
            filterBuildable: dependency.filterBuildable
        )
    }
}
