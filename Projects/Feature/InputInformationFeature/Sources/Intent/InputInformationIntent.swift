import Foundation
import InputProfileInfoFeatureInterface

final class InputInformationIntent: InputInformationIntentProtocol {
    private weak var model: (any InputInformationActionProtocol)?

    init(model: any InputInformationActionProtocol) {
        self.model = model
    }
}

extension InputInformationIntent: InputProfileDelegate {
    func successToInputProfile() {
        model?.nextButtonDidTap()
    }
}
