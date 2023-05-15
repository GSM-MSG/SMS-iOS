import Foundation

final class InputProfileInfoIntent: InputProfileInfoIntentProtocol {
    private weak var model: (any InputProfileInfoActionProtocol)?

    init(model: any InputProfileInfoActionProtocol) {
        self.model = model
    }

    func updateIntroduce(introduce: String) {
        model?.updateIntroduce(introduce: introduce)
    }

    func updateEmail(email: String) {
        model?.updateEmail(email: email)
    }

    func updateMajor(major: String) {
        model?.updateMajor(major: major)
    }

    func updatePortfoiloURL(portfoiloURL: String) {
        model?.updatePortfoiloURL(portfoiloURL: portfoiloURL)
    }

    func updateTechStack(techStack: String) {
        model?.updateTeckStack(techStack: techStack)
    }
}
