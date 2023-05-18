import Foundation

final class InputLanguageInfoIntent: InputLanguageInfoIntentProtocol {
    private weak var model: (any InputLanguageInfoActionProtocol)?

    init(model: any InputLanguageInfoActionProtocol) {
        self.model = model
    }
}
