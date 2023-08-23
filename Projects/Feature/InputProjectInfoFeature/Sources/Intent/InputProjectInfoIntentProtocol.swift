import DesignSystem
import Foundation

protocol InputProjectInfoIntentProtocol {
    func prevButtonDidTap()
    func nextButtonDidTap(projects: [ProjectInfo])
    func projectToggleButtonDidTap(index: Int)
    func updateProjectName(index: Int, name: String)
    func updateIconImage(index: Int, image: PickedImageResult)
    func appendPreviewImageButtonDidTap(index: Int, previewsCount: Int)
    func appendPreviewImage(index: Int, image: PickedImageResult)
    func removePreviewImageDidTap(index: Int, previewIndex: Int)
    func updateProjectContent(index: Int, content: String)
    func techStacksDidSelect(index: Int, techStacks: [String])
    func removeProjectTechStackButtonDidTap(index: Int, techStack: String)
    func updateProjectMainTask(index: Int, mainTask: String)
    func projectStartAtDidSelect(index: Int, startAt: Date)
    func projectEndAtDidSelect(index: Int, endAt: Date)
    func projectIsInProgressButtonDidTap(index: Int, isInProgress: Bool)
    func updateProjectLinkName(index: Int, linkIndex: Int, name: String)
    func updateProjectLinkURL(index: Int, linkIndex: Int, url: String)
    func relatedLinkAppendButtonDidTap(index: Int)
    func removeProjectRelatedLinkDidTap(index: Int, linkIndex: Int)
    func projectAppendButtonDidTap()
    func projectRemoveButtonDidTap(index: Int)
    func iconImageButtonDidTap(index: Int)
    func iconImagePickerDismissed()
    func previewImagePickerDismissed()
    func startAtButtonDidTap(index: Int)
    func endAtButtonDidTap(index: Int)
    func startAtDatePickerDismissed()
    func endAtDatePickerDismissed()
    func techStackAppendButtonDidTap(index: Int)
    func techStackAppendDismissed()
    func toastDismissed()
}
