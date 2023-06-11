import BaseFeature
import Foundation
import NeedleFoundation
import SwiftUI

public protocol StudentDetailDependency: Dependency {}

public final class StudentDetailComponent: Component<StudentDetailDependency>, StudentDetailBuildable {
    public func makeView(with profileImageNamespace: Namespace.ID) -> some View {
        let model = StudentDetailModel()
        let intent = StudentDetailIntent()
        let container = MVIContainer(
            intent: intent as StudentDetailIntentProtocol,
            model: model as StudentDetailStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return StudentDetailView(container: container)
    }
}
