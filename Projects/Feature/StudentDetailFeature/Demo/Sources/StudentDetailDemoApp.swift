import BaseFeature
import SwiftUI
import UserDomainTesting
import StudentDomainTesting
import JwtStoreInterface
@testable import JwtStoreTesting
@testable import StudentDetailFeature
@testable import StudentDomain

@main
struct StudentDetailDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let jwtStore = FakeJwtStore()
            let remoteStudentDataSource = RemoteStudentDataSourceImpl(jwtStore: jwtStore)
            let studentRepository = StudentRepositoryImpl(remoteStudentDataSource: remoteStudentDataSource)
            let fetchStudentDetailUseCase = FetchStudentDetailUseCaseImpl(studentRepository: studentRepository)
            let model = StudentDetailModel()
            let intent = StudentDetailIntent(
                userID: "2f004cba-a22e-414a-9e52-afd54c762216",
                model: model,
                loadUserRoleUseCase: LoadUserRoleUseCaseSpy(),
                fetchStudentDetailUseCase: fetchStudentDetailUseCase
            )
            let container = MVIContainer(
                intent: intent as StudentDetailIntentProtocol,
                model: model as StudentDetailStateProtocol,
                modelChangePublisher: model.objectWillChange
            )
            StudentDetailView(container: container)
        }
    }
}
