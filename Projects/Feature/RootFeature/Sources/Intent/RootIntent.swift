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
        model?.updateSceneType(type: .main)
    }
}

extension RootIntent: SigninDelegate {
    func successToSignin(isAlreadySignUp: Bool) {
        model?.updateSceneType(type: isAlreadySignUp ? .main : .inputInformation)
    }

    func guestSignin() {
        model?.updateSceneType(type: .home)
    }
}

extension RootIntent: MainDelegate {
}
