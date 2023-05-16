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
        // TODO: 숫자만 검사하도록 변경
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
