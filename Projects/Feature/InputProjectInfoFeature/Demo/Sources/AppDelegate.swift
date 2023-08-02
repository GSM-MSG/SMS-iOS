import BaseFeature
import SwiftUI
import InputProjectInfoFeatureInterface
import TechStackAppendFeatureInterface
@testable import InputProjectInfoFeature
@testable import FileDomainTesting

final class DummyInputProjectInfoDelegate: InputProjectInfoDelegate {
    func projectInfoPrevButtonDidTap() {}
    func completeToInputProjectInfo(input: [InputProjectInfoObject]) {}
}

struct DummyTechStackAppendBuildable: TechStackAppendBuildable {
    func makeView(initial techStacks: [String], completion: @escaping ([String]) -> Void) -> some View {
        EmptyView()
    }
}

@main
struct InputProjectInfoApp: App {
    var imageUploadUseCaseSpy: ImageUploadUseCaseSpy!

    var body: some Scene {
        WindowGroup {
            let model = InputProjectInfoModel()
            let intent = InputProjectInfoIntent(
                model: model,
                delegate: DummyInputProjectInfoDelegate(), imageUploadUseCase: imageUploadUseCaseSpy
            )
            let container = MVIContainer(
                intent: intent as InputProjectInfoIntentProtocol,
                model: model as InputProjectInfoStateProtocol,
                modelChangePublisher: model.objectWillChange
            )
            InputProjectInfoView(
                techStackAppendBuildable: DummyTechStackAppendBuildable(),
                container: container
            )
        }
    }
}
