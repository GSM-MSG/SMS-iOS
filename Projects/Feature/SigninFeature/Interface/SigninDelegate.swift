public protocol SigninDelegate: AnyObject {
    func successToSignin(isAlreadySignUp: Bool)
    func guestSignin()
}
