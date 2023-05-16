import Foundation
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface

final class InputInformationIntent: InputInformationIntentProtocol {
    private weak var model: (any InputInformationActionProtocol)?

    init(model: any InputInformationActionProtocol) {
        self.model = model
    }
}

extension InputInformationIntent: InputProfileDelegate {
    func completeToInputProfile() {
        model?.nextButtonDidTap()
    }
}

extension InputInformationIntent: InputSchoolLifeDelegate {
    func schoolLifePrevButtonDidTap() {
        model?.prevButtonDidTap()
    }

    func completeToInputSchoolLife() {
        model?.nextButtonDidTap()
    }
}
