import Foundation

final class InputMilitaryInfoIntent: InputMilitaryInfoIntentProtocol {
    private weak var model: (any InputMilitaryInfoActionProtocol)?

    init(model: any InputMilitaryInfoActionProtocol) {
        self.model = model
    }
}
