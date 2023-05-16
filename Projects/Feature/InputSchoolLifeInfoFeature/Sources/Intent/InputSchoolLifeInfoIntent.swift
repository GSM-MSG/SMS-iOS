import Foundation

final class InputSchoolLifeInfoIntent: InputSchoolLifeInfoIntentProtocol {
    private weak var model: (any InputSchoolLifeInfoActionProtocol)?

    init(model: any InputSchoolLifeInfoActionProtocol) {
        self.model = model
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
}
