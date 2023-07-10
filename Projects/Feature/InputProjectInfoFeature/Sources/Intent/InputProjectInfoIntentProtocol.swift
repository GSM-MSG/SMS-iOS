import DesignSystem
import Foundation

protocol InputProjectInfoIntentProtocol {
    func updateProjectName(index: Int, name: String)
    func updateIconImage(index: Int, image: PickedImageResult)
    func appendPreviewImageButtonDidTap(index: Int)
    func appendPreviewImage(index: Int, image: PickedImageResult)
    func removePreviewImageDidTap(index: Int, previewIndex: Int)
    func updateProjectContent(index: Int, content: String)
    func techStacksDidSelect(index: Int, techStacks: [String])
    func updateProjectMainTask(index: Int, mainTask: String)
    func projectStartAtButtonDidTap(index: Int)
    func projectEndAtButtonDidTap(index: Int)
    func projectStartAtDidSelect(index: Int, startAt: Date)
    func projectEndAtDidSelect(index: Int, endAt: Date)
    func updateProjectLinkName(index: Int, linkIndex: Int, name: String)
    func updateProjectLinkURL(index: Int, linkIndex: Int, url: String)
    func relatedLinkAppendButtonDidTap(index: Int)
    func removeProjectRelatedLinkDidTap(index: Int, linkIndex: Int)
    func projectAppendButtonDidTap()
    func iconImageButtonDidTap(index: Int)
    func iconImagePickerDismissed()
    func previewImagePickerDismissed()
    func startAtButtonDidTap(index: Int)
    func endAtButtonDidTap(index: Int)
    func startAtDatePickerDismissed()
    func endAtDatePickerDismissed()
}
