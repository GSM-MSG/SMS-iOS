import DesignSystem
import Foundation

final class InputProjectInfoIntent: InputProjectInfoIntentProtocol {
    private weak var model: (any InputProjectInfoActionProtocol)?

    init(model: any InputProjectInfoActionProtocol) {
        self.model = model
    }

    func updateProjectName(index: Int, name: String) {
        model?.updateProjectName(index: index, name: name)
    }

    func updateIconImage(index: Int, image: PickedImageResult) {
        model?.updateIconImage(index: index, image: image)
    }

    func appendPreviewImageButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedPreviewImagePicker(isPresented: true)
    }

    func appendPreviewImage(index: Int, image: PickedImageResult) {
        model?.appendPreviewImage(index: index, image: image)
    }

    func removePreviewImageDidTap(index: Int, previewIndex: Int) {
        model?.removePreviewImage(index: index, previewIndex: previewIndex)
    }

    func updateProjectContent(index: Int, content: String) {
        model?.updateProjectContent(index: index, content: content)
    }

    func techStacksDidSelect(index: Int, techStacks: [String]) {
        model?.updateProjectTechStacks(index: index, techStacks: techStacks)
    }

    func updateProjectMainTask(index: Int, mainTask: String) {
        model?.updateProjectMainTask(index: index, mainTask: mainTask)
    }

    func projectStartAtButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedStartAtDatePicker(isPresented: true)
    }

    func projectEndAtButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedEndAtDatePicker(isPresented: true)
    }

    func projectStartAtDidSelect(index: Int, startAt: Date) {
        model?.updateProjectStartAt(index: index, startAt: startAt)
    }

    func projectEndAtDidSelect(index: Int, endAt: Date) {
        model?.updateProjectEndAt(index: index, endAt: endAt)
    }

    func updateProjectLinkName(index: Int, linkIndex: Int, name: String) {
        model?.updateProjectLinkName(index: index, linkIndex: linkIndex, name: name)
    }

    func updateProjectLinkURL(index: Int, linkIndex: Int, url: String) {
        model?.updateProjectLinkURL(index: index, linkIndex: linkIndex, url: url)
    }

    func relatedLinkAppendButtonDidTap(index: Int) {
        model?.appendEmptyRelatedLink(index: index)
    }

    func removeProjectRelatedLinkDidTap(index: Int, linkIndex: Int) {
        model?.removeProjectRelatedLink(index: index, linkIndex: linkIndex)
    }

    func projectAppendButtonDidTap() {
        model?.appendEmptyProject()
    }

    func iconImageButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedImagePicker(isPresented: true)
    }

    func iconImagePickerDismissed() {
        model?.updateIsPresentedImagePicker(isPresented: false)
    }

    func previewImagePickerDismissed() {
        model?.updateIsPresentedPreviewImagePicker(isPresented: false)
    }

    func startAtButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedStartAtDatePicker(isPresented: true)
    }

    func endAtButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedEndAtDatePicker(isPresented: true)
    }

    func startAtDatePickerDismissed() {
        model?.updateIsPresentedStartAtDatePicker(isPresented: false)
    }

    func endAtDatePickerDismissed() {
        model?.updateIsPresentedEndAtDatePicker(isPresented: false)
    }
}
