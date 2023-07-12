import BaseFeature
import SwiftUI
import InputProjectInfoFeatureInterface
@testable import InputProjectInfoFeature

final class DummyInputProjectInfoDelegate: InputProjectInfoDelegate {
    func projectInfoPrevButtonDidTap() {}
    func completeToInputProjectInfo(input: InputProjectInfoObject) {}
}

@main
struct InputProjectInfoApp: App {
    var body: some Scene {
        WindowGroup {
            let model = InputProjectInfoModel()
            let intent = InputProjectInfoIntent(
                model: model,
                delegate: DummyInputProjectInfoDelegate()
            )
            let container = MVIContainer(
                intent: intent as InputProjectInfoIntentProtocol,
                model: model as InputProjectInfoStateProtocol,
                modelChangePublisher: model.objectWillChange
            )
            InputProjectInfoView(container: container)
        }
    }
}
