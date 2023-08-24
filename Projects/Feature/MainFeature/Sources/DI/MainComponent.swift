import SwiftUI
import BaseFeature
import MainFeatureInterface
import NeedleFoundation
import StudentDetailFeatureInterface
import StudentDomainInterface
import FilterFeatureInterface
import UserDomainInterface
import MyPageFeatureInterface

public protocol MainDependency: Dependency {
    var studentDomainBuildable: any StudentDomainBuildable { get }
    var filterBuildable: any FilterBuildable { get }
    var myPageBuildable: any MyPageBuildable { get }
    var studentDetailBuildable: any StudentDetailBuildable { get }
    var userDomainBuildable: any UserDomainBuildable { get }
}

public final class MainComponent: Component<MainDependency>, MainBuildable {
    public func makeView(delegate: any MainDelegate) -> some View {
        let model = MainModel()
        let intent = MainIntent(
            model: model,
            mainDelegate: delegate,
            fetchStudentListUseCase: dependency.studentDomainBuildable.fetchStudentListUseCase,
            loadUserRoleUseCase: dependency.userDomainBuildable.loadUserRoleUseCase
        )
        let container = MVIContainer(
            intent: intent as MainIntentProtocol,
            model: model as MainStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return MainView(
            container: container,
            studentDetailBuildable: dependency.studentDetailBuildable,
            filterBuildable: dependency.filterBuildable,
            myPageBuildable: dependency.myPageBuildable
        )
    }
}
