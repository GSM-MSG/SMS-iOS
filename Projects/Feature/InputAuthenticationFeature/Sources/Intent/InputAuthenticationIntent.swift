import Foundation
import InputAuthenticationFeatureInterface

final class InputAuthenticationIntent: InputAuthenticationIntentProtocol {
    private weak var model: (any InputAuthenticationActionProtocol)?
    private weak var inputAuthenticationDelegate: (any InputAuthenticationDelegate)?
    
    init(
        model: any InputAuthenticationActionProtocol,
        inputAuthenticationDelegate: any InputAuthenticationDelegate
    ) {
        self.model = model
        self.inputAuthenticationDelegate = inputAuthenticationDelegate
    }
    
    func updateAuthenticationTitle(index: Int, title: String) {
        model?.updateAuthenticationTitle(index: index, title: title)
    }
    
    func updateAuthenticationContent(index: Int, content: String) {
        model?.updateAuthenticationContent(index: index, content: content)
    }
    
    func completeButtonDidTap() {
        inputAuthenticationDelegate?.completeToInputInputAuthentication()
    }
    
    func authenticationAppendButtonDidTap() {
        model?.appendEmptyAuthentication()
    }
    
    func appendEmptyAuthentication() {
        model?.appendEmptyAuthentication()
    }
}
