final class GSMAuthenticationFormIntent: GSMAuthenticationFormIntentProtocol {
    weak var model: (any GSMAuthenticationFormActionProtocol)?

    init(model: any GSMAuthenticationFormActionProtocol) {
        self.model = model
    }
}
