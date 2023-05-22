import DesignSystem
import Foundation

protocol InputProfileInfoIntentProtocol {
    func updateIntroduce(introduce: String)
    func updateEmail(email: String)
    func updateMajor(major: String)
    func updatePortfolioURL(portfolioURL: String)
    func updateTechStack(techStack: String)
    func majorSheetIsRequired()
    func majorSheetDismissed()
    func imagePickerIsRequired()
    func imagePickerDismissed()
    func imageDidSelected(imageResult: PickedImageResult?)
    func nextButtonDidTap(state: any InputProfileInfoStateProtocol)
}
