import Foundation
import InputSchoolLifeInfoFeatureInterface

final class InputSchoolLifeInfoIntent: InputSchoolLifeInfoIntentProtocol {
    private weak var model: (any InputSchoolLifeInfoActionProtocol)?
    private weak var inputSchoolLifeDelegate: (any InputSchoolLifeDelegate)?

    init(
        model: any InputSchoolLifeInfoActionProtocol,
        inputSchoolLifeDelegate: any InputSchoolLifeDelegate
    ) {
        self.model = model
        self.inputSchoolLifeDelegate = inputSchoolLifeDelegate
    }

    func updateAuthenticationScore(score: String) {
        model?.updateAuthenticationScore(score: score)
    }

    func hwpFilImporterIsRequred() {
        model?.updateIsPresentedHWPFileImporter(isPresented: true)
    }

    func hwpFilImporterDismissed() {
        model?.updateIsPresentedHWPFileImporter(isPresented: false)
    }

    func prevButtonDidTap() {
        inputSchoolLifeDelegate?.schoolLifePrevButtonDidTap()
    }

    func nextButtonDidTap() {
        inputSchoolLifeDelegate?.completeToInputSchoolLife()
    }
}
