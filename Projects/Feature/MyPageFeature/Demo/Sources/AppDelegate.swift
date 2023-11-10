import MyPageFeatureInterface
import SwiftUI
import TechStackAppendFeatureInterface
@testable import AuthDomainTesting
@testable import MyPageFeature
@testable import UserDomainTesting
@testable import FileDomainTesting
@testable import StudentDomainTesting
@testable import MajorDomainTesting

final class DummyMyPageDelegate: MyPageDelegate {
    func completeModify() {}

    func logout() {}
}

struct DummyTechStackAppendBuildable: TechStackAppendBuildable {
    func makeView(initial techStacks: [String], completion: @escaping ([String]) -> Void) -> some View {
        EmptyView()
    }
}

@main
struct MyPageDemoApp: App {
    var body: some Scene {
        WindowGroup {
            let model = MyPageModel()
            let fetchMyProfileUseCase = FetchMyProfileUseCaseSpy()
            let logoutUseCase = LogoutUseCaseSpy()
            let withdrawalUseCase = WithdrawalUseCaseSpy()
            let imageUploadUseCase = ImageUploadUseCaseSpy()
            let modifyInformationUseCase = ModifyInformationUseCaseSpy()
            let fetchMajorListUseCase = FetchMajorListUseCaseSpy()
            let intent = MyPageIntent(
                model: model,
                myPageDelegate: DummyMyPageDelegate(),
                fetchMyProfileUseCase: fetchMyProfileUseCase,
                logoutUseCase: logoutUseCase,
                withdrawalUseCase: withdrawalUseCase,
                imageUploadUseCase: imageUploadUseCase,
                modifyInformationUseCase: modifyInformationUseCase,
                fetchMajorListUseCase: fetchMajorListUseCase
            )
            MyPageView(
                container: .init(
                    intent: intent as MyPageIntentProtocol,
                    model: model as MyPageStateProtocol,
                    modelChangePublisher: model.objectWillChange
                ), techStackAppendBuildable: DummyTechStackAppendBuildable()
            )
        }
    }
}
