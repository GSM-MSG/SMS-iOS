import Foundation
import InputProfileInfoFeatureInterface

final class InputProfileInfoIntent: InputProfileInfoIntentProtocol {
    private weak var model: (any InputProfileInfoActionProtocol)?
    private weak var inputProfileDelegate: (any InputProfileDelegate)?

    init(
        model: any InputProfileInfoActionProtocol,
        inputProfileDelegate: any InputProfileDelegate
    ) {
        self.model = model
        self.inputProfileDelegate = inputProfileDelegate
    }

    func updateIntroduce(introduce: String) {
        model?.updateIntroduce(introduce: introduce)
    }

    func updateEmail(email: String) {
        model?.updateEmail(email: email)
    }

    func updateMajor(major: String) {
        model?.updateMajor(major: major)
    }

    func updatePortfolioURL(portfolioURL: String) {
        model?.updatePortfolioURL(portfolioURL: portfolioURL)
    }

    func updateTechStack(techStack: String) {
        model?.updateTeckStack(techStack: techStack)
    }

    func majorSheetIsRequired() {
        model?.updateIsPresentedMajorSheet(isPresented: true)
    }

    func majorSheetDismissed() {
        model?.updateIsPresentedMajorSheet(isPresented: false)
    }

    func nextButtonDidTap() {
        inputProfileDelegate?.completeToInputProfile()
    }
}
