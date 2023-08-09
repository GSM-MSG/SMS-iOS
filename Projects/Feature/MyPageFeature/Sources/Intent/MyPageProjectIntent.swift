import DesignSystem
import Foundation

protocol MyPageProjectIntentProtocol {
    func projectToggleButtonDidTap(index: Int)
    func updateProjectName(index: Int, name: String)
    func updateIconImage(index: Int, image: PickedImageResult)
    func appendPreviewImageButtonDidTap(index: Int)
    func appendPreviewImage(index: Int, image: PickedImageResult)
    func removePreviewImageDidTap(index: Int, previewIndex: Int)
    func updateProjectContent(index: Int, content: String)
    func techStacksDidSelect(index: Int, techStacks: [String])
    func removeProjectTechStackButtonDidTap(index: Int, techStack: String)
    func updateProjectMainTask(index: Int, mainTask: String)
    func projectStartAtButtonDidTap(index: Int)
    func projectEndAtButtonDidTap(index: Int)
    func projectStartAtDidSelect(index: Int, startAt: Date)
    func projectEndAtDidSelect(index: Int, endAt: Date)
    func projectIsInProgressButtonDidTap(index: Int, isInProgress: Bool)
    func updateProjectLinkName(index: Int, linkIndex: Int, name: String)
    func updateProjectLinkURL(index: Int, linkIndex: Int, url: String)
    func relatedLinkAppendButtonDidTap(index: Int)
    func removeProjectRelatedLinkDidTap(index: Int, linkIndex: Int)
    func projectAppendButtonDidTap()
    func projectRemoveButtonDidTap(index: Int)
    func projectIconImageButtonDidTap(index: Int)
    func projectIconImagePickerDismissed()
    func projectPreviewImagePickerDismissed()
    func projectStartAtDatePickerDismissed()
    func projectEndAtDatePickerDismissed()
    func projectTechStackAppendButtonDidTap(index: Int)
    func projectTechStackAppendDismissed()
}

extension MyPageIntent: MyPageProjectIntentProtocol {
    func projectToggleButtonDidTap(index: Int) {
        model?.toggleCollapsedProject(index: index)
    }

    func updateProjectName(index: Int, name: String) {
        model?.updateProjectName(index: index, name: name)
    }

    func updateIconImage(index: Int, image: PickedImageResult) {
        Task {
            do {
                async let iconImageURL = imageUploadUseCase.execute(
                    image: image.uiImage.jpegData(compressionQuality: 0.2) ?? .init(),
                    fileName: image.fileName
                )
                try await model?.updateIconImage(index: index, imageURL: iconImageURL)
            }
        }
    }

    func appendPreviewImageButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedPreviewImagePicker(isPresented: true)
    }

    func appendPreviewImage(index: Int, image: PickedImageResult) {
        Task {
            do {
                async let previewImageURL = imageUploadUseCase.execute(
                    image: image.uiImage.jpegData(compressionQuality: 0.2) ?? .init(),
                    fileName: image.fileName
                )
                try await model?.appendPreviewImage(index: index, imageURL: previewImageURL)
            }
        }
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

    func removeProjectTechStackButtonDidTap(index: Int, techStack: String) {
        model?.removeProjectTechStack(index: index, techStack: techStack)
    }

    func updateProjectMainTask(index: Int, mainTask: String) {
        model?.updateProjectMainTask(index: index, mainTask: mainTask)
    }

    func projectStartAtButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedProjectStartAtDatePicker(isPresented: true)
    }

    func projectEndAtButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedProjectEndAtDatePicker(isPresented: true)
    }

    func projectIsInProgressButtonDidTap(index: Int, isInProgress: Bool) {
        model?.updateIsInProgress(index: index, isInProgress: isInProgress)
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

    func projectRemoveButtonDidTap(index: Int) {
        model?.removeProject(index: index)
    }

    func projectIconImageButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedProjectImagePicker(isPresented: true)
    }

    func projectIconImagePickerDismissed() {
        model?.updateIsPresentedProjectImagePicker(isPresented: false)
    }

    func projectPreviewImagePickerDismissed() {
        model?.updateIsPresentedPreviewImagePicker(isPresented: false)
    }

    func projectStartAtDatePickerDismissed() {
        model?.updateIsPresentedProjectStartAtDatePicker(isPresented: false)
    }

    func projectEndAtDatePickerDismissed() {
        model?.updateIsPresentedProjectEndAtDatePicker(isPresented: false)
    }

    func projectTechStackAppendButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedProjectTechStackAppend(isPresented: true)
    }

    func projectTechStackAppendDismissed() {
        model?.updateIsPresentedProjectTechStackAppend(isPresented: false)
    }
}
