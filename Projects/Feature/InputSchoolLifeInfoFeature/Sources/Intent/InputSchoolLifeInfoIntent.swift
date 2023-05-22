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
        guard score.isEmpty || Int(score) != nil else { return }
        model?.updateAuthenticationScore(score: score)
    }

    func hwpFileImporterIsRequred() {
        model?.updateIsPresentedHWPFileImporter(isPresented: true)
    }

    func hwpFileImporterDismissed() {
        model?.updateIsPresentedHWPFileImporter(isPresented: false)
    }

    func hwpFileDidSelect(url: URL) {
        model?.updateHWPFileURL(url: url)
    }

    func failedToImportHWPFile() {
        model?.updateErrorField(field: [.hwp])
    }

    func prevButtonDidTap() {
        inputSchoolLifeDelegate?.schoolLifePrevButtonDidTap()
    }

    func nextButtonDidTap(state: any InputSchoolLifeInfoStateProtocol) {
        var errorSet = Set<InputSchoolLifeErrorField>()

        if Int(state.authenticationScroe) != nil {
            errorSet.insert(.gsmAuthentication)
        }

        if state.hwpFileURL != nil {
            errorSet.insert(.hwp)
        }

        guard
            let gsmScroe = Int(state.authenticationScroe),
            let hwpURL = state.hwpFileURL,
            let hwpData = try? Data(contentsOf: hwpURL)
        else {
            model?.updateErrorField(field: errorSet)
            return
        }

        let input = InputSchoolLifeInformationObject(
            hwpFilename: state.hwpFilename,
            gsmAuthenticationScore: gsmScroe,
            hwpData: hwpData
        )

        inputSchoolLifeDelegate?.completeToInputSchoolLife(input: input)
    }
}
