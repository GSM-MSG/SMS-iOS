import BaseFeature
import SwiftUI
import UserDomainTesting
@testable import StudentDetailFeature

@main
struct StudentDetailDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let model = StudentDetailModel()
            let intent = StudentDetailIntent(model: model, loadUserRoleUseCase: LoadUserRoleUseCaseSpy())
            let container = MVIContainer(
                intent: intent as StudentDetailIntentProtocol,
                model: model as StudentDetailStateProtocol,
                modelChangePublisher: model.objectWillChange
            )
            StudentDetailView(container: container)
        }
    }
}
