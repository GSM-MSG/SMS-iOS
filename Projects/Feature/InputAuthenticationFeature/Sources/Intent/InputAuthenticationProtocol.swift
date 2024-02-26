import Foundation

protocol InputAuthenticationIntentProtocol {
    func completeButtonDidTap()
    func updateAuthenticationTitle(index: Int, title: String)
    func updateAuthenticationContent(index: Int, content: String)
    func authenticationAppendButtonDidTap()
    func appendEmptyAuthentication()
}
