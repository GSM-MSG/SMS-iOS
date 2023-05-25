import Foundation
import InputInformationFeatureInterface

final class RootIntent: RootIntentProtocol {
    private weak var model: (any RootActionProtocol)?

    init(model: any RootActionProtocol) {
        self.model = model
    }
}

extension RootIntent: InputInformationDelegate {
    func completeToInputInformation() {
        model?.updateSceneType(type: .home)
    }
}
