import Foundation

protocol SigninIntentProtocol {
    func signin(code: String)
    func guestSignin()
}
