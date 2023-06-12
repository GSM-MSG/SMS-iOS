import SwiftUI
import MainFeatureInterface
import StudentDomainInterface
import NeedleFoundation
import BaseFeature

public protocol MainDependency: Dependency {
    var studentDomainBuildable: any StudentDomainBuildable { get }
}

public final class MainComponent: Component<MainDependency>, MainBuildable {
    public func makeView(delegate: any MainDelegate) -> some View {
        let model = MainModel()
        let intent = MainIntent(
            model: model,
            mainDelegate: delegate,
            fetchStudentListUseCase: dependency.studentDomainBuildable.fetchStudentListUseCase
        )
        let container = MVIContainer(
            intent: intent as MainIntentProtocol,
            model: model as MainStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return MainView(container: container)
    }
}
