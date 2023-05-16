import Foundation

final class InputWorkInfoIntent: InputWorkInfoIntentProtocol {
    private weak var model: (any InputWorkInfoActionProtocol)?

    init(model: any InputWorkInfoActionProtocol) {
        self.model = model
    }
}
