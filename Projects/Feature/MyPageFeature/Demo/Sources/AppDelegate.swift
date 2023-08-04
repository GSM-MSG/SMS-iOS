import MyPageFeatureInterface
import SwiftUI
@testable import AuthDomainTesting
@testable import MyPageFeature
@testable import UserDomainTesting

final class DummyMyPageDelegate: MyPageDelegate {
    func logout() {}
}
@main
struct MyPageDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let model = MyPageModel()
            let fetchMyProfileUseCase = FetchMyProfileUseCaseSpy()
            let logoutUseCase = LogoutUseCaseSpy()
            let withdrawalUseCase = WithdrawalUseCaseSpy()
            let intent = MyPageIntent(
                model: model,
                myPageDelegate: DummyMyPageDelegate(),
                fetchMyProfileUseCase: fetchMyProfileUseCase,
                logoutUseCase: logoutUseCase,
                withdrawalUseCase: withdrawalUseCase
            )
            MyPageView(
                container: .init(
                    intent: intent as MyPageIntentProtocol,
                    model: model as MyPageStateProtocol,
                    modelChangePublisher: model.objectWillChange
                )
            )
        }
    }
}
