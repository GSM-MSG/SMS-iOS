import Foundation

protocol GSMAuthenticationFormIntentProtocol {
    func onAppear()
    func saveButtonDidTap(state: any GSMAuthenticationFormStateProtocol)
}
