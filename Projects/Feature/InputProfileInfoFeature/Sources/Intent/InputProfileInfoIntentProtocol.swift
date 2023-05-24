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
    func imageMethodPickerIsRequired()
    func imageMethodPickerIsDismissed()
    func imageDidSelected(imageResult: PickedImageResult?)
    func nextButtonDidTap(state: any InputProfileInfoStateProtocol)
    func cameraIsRequired()
    func cameraIsDismissed()
    func activeSelfEntering()
    func deActiveSelfEntering()
}
