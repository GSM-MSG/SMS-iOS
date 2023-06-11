import BaseFeature
import Foundation
import NeedleFoundation
import SwiftUI
import StudentDetailFeatureInterface
import UserDomainInterface

public protocol StudentDetailDependency: Dependency {
    var userDomainBuildable: any UserDomainBuildable { get}
}

public final class StudentDetailComponent: Component<StudentDetailDependency>, StudentDetailBuildable {
    public func makeView(with profileImageNamespace: Namespace.ID) -> some View {
        let model = StudentDetailModel()
        let intent = StudentDetailIntent(
            model: model,
            loadUserRoleUseCase: dependency.userDomainBuildable.loadUserRoleUseCase
        )
        let container = MVIContainer(
            intent: intent as StudentDetailIntentProtocol,
            model: model as StudentDetailStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return StudentDetailView(container: container)
    }
}
