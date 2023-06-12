import BaseFeature
import SwiftUI
import UserDomainTesting
import StudentDomainTesting
@testable import StudentDetailFeature

@main
struct StudentDetailDemoApp: App {
    @Namespace var dummyNamespace

    var body: some Scene {
        WindowGroup {
            let model = StudentDetailModel()
            let intent = StudentDetailIntent(
                userID: "A",
                model: model,
                loadUserRoleUseCase: LoadUserRoleUseCaseSpy(),
                fetchStudentDetailUseCase: FetchStudentDetailUseCaseSpy()
            )
            let container = MVIContainer(
                intent: intent as StudentDetailIntentProtocol,
                model: model as StudentDetailStateProtocol,
                modelChangePublisher: model.objectWillChange
            )
            StudentDetailView(container: container, profileImageNamespace: dummyNamespace)
        }
    }
}
