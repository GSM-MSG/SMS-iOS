import BaseFeature
import SwiftUI
import InputTeacherInfoFeatureInterface
@testable import InputTeacherInfoFeature

final class DummyInputTeacherInfoDelegate: InputTeacherDelegate {
    func completeToInputTeacherInformation() {}
}

@main
struct InputTeacherInfoApp: App {
    var body: some Scene {
        WindowGroup {
            let model = InputTeacherInfoModel()
            let intent = InputTeacherInfoIntent(
                model: model,
                teacherDelegate: DummyInputTeacherInfoDelegate()
            )
            let container = MVIContainer(
                intent: intent as InputTeacherInfoIntentProtocol,
                model: model as InputTeacherInfoStateProtocol,
                modelChangePublisher: model.objectWillChange
            )
            InputTeacherInfoView(container: container)
        }
    }
}
