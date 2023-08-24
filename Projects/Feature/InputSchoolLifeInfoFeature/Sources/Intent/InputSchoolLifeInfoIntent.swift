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

    func prevButtonDidTap() {
        inputSchoolLifeDelegate?.schoolLifePrevButtonDidTap()
    }

    func nextButtonDidTap(state: any InputSchoolLifeInfoStateProtocol) {
        var errorSet = Set<InputSchoolLifeErrorField>()

        if Int(state.authenticationScore) == nil || state.authenticationScore.isEmpty {
            errorSet.insert(.gsmAuthentication)
        }

        model?.updateErrorField(field: errorSet)
        guard
            let gsmScore = Int(state.authenticationScore),
            errorSet.isEmpty
        else {
            return
        }

        inputSchoolLifeDelegate?.completeToInputSchoolLife(gsmAuthenticationScore: gsmScore)
    }
}
