import Foundation

protocol SigninIntentProtocol {
    func onApper()
    func signin(code: String)
    func presentToAlert()
    func dismissToAlert()
}
