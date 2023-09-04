import Foundation
import InputInformationFeatureInterface
import MainFeatureInterface
import SigninFeatureInterface
import SplashFeatureInterface
import MyPageFeatureInterface

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
        model?.updateSceneType(type: .main)
    }
}

extension RootIntent: MainDelegate {
    func logout() {
        model?.updateSceneType(type: .signin)
    }
}

extension RootIntent: SplashDelegate {
    func isLoggedIn(isLoggedIn: Bool) {
        model?.updateSceneType(type: isLoggedIn ? .main : .signin)
    }
}

extension RootIntent: MyPageDelegate {
    func completeModify() {
        model?.updateSceneType(type: .main)
    }
}
