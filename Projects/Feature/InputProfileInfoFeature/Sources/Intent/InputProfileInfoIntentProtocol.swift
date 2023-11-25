import DesignSystem
import Foundation

protocol InputProfileInfoIntentProtocol {
    func updateIntroduce(introduce: String)
    func updateEmail(email: String)
    func updateMajor(major: String)
    func techStackAppendIsRequired()
    func techStackAppendDismissed()
    func techStackAppendDidComplete(techStacks: [String])
    func removeTechStack(techStack: String)
    func majorSheetIsRequired()
    func majorSheetDismissed()
    func imagePickerIsRequired()
    func imagePickerDismissed()
    func imageMethodPickerIsRequired()
    func imageMethodPickerDismissed()
    func imageDidSelected(imageResult: PickedImageResult?)
    func completeButtonDidTap(state: any InputProfileInfoStateProtocol)
    func cameraIsRequired()
    func cameraDismissed()
    func activeSelfEntering()
    func deActiveSelfEntering()
    func onLoad()
}
