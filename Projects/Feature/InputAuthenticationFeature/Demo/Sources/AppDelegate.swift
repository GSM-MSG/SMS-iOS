import BaseFeature
import SwiftUI
import InputAuthenticationFeatureInterface
@testable import InputAuthenticationFeature

final class DummyInputAuthenticationDelegate: InputAuthenticationDelegate {
    func completeToInputInputAuthentication() {}
}

@main
struct InputAuthenticationApp: App {
    var body: some Scene {
        WindowGroup {
            let model = InputAuthenticationModel()
            let intent = InputAuthenticationIntent(
                model: model,
                inputAuthenticationDelegate: DummyInputAuthenticationDelegate()
            )
            let container = MVIContainer(
                intent: intent as InputAuthenticationIntentProtocol,
                model: model as InputAuthenticationStateProtocol,
                modelChangePublisher: model.objectWillChange
            )
            InputAuthenticationView(container: container)
        }
    }
}
