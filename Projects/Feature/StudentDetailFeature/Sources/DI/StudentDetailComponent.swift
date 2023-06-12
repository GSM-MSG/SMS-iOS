import BaseFeature
import Foundation
import NeedleFoundation
import SwiftUI
import StudentDetailFeatureInterface
import UserDomainInterface
import StudentDomainInterface

public protocol StudentDetailDependency: Dependency {
    var userDomainBuildable: any UserDomainBuildable { get }
    var studentDomainBuildable: any StudentDomainBuildable { get }
}

public final class StudentDetailComponent: Component<StudentDetailDependency>, StudentDetailBuildable {
    public func makeView(userID: String, with profileImageNamespace: Namespace.ID) -> some View {
        let model = StudentDetailModel()
        let intent = StudentDetailIntent(
            userID: userID,
            model: model,
            loadUserRoleUseCase: dependency.userDomainBuildable.loadUserRoleUseCase,
            fetchStudentDetailUseCase: dependency.studentDomainBuildable.fetchStudentDetailUSeCase
        )
        let container = MVIContainer(
            intent: intent as StudentDetailIntentProtocol,
            model: model as StudentDetailStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return StudentDetailView(container: container)
    }
}
