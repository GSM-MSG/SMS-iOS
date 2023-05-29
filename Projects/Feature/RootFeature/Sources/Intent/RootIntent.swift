import Foundation
import InputInformationFeatureInterface
import SigninFeatureInterface
import MainFeatureInterface

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

extension RootIntent: SigninDelegate {
    func successToSignin(isAlreadySignUp: Bool) {
        model?.updateSceneType(type: isAlreadySignUp ? .home : .inputInformation)
    }
}

extension RootIntent: MainDelegate {
}
