import BaseFeature
import SwiftUI
@testable import InputProjectInfoFeature

@main
struct InputProjectInfoApp: App {
    var body: some Scene {
        WindowGroup {
            let model = InputProjectInfoModel()
            let intent = InputProjectInfoIntent(
                model: model
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
