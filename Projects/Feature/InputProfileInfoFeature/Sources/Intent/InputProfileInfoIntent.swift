import Foundation

final class InputProfileInfoIntent: InputProfileInfoIntentProtocol {
    private weak var model: (any InputProfileInfoActionProtocol)?

    init(model: any InputProfileInfoActionProtocol) {
        self.model = model
    }
}
