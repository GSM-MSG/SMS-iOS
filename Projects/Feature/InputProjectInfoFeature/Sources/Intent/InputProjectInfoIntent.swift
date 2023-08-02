import DesignSystem
import Foundation
import FoundationUtil
import InputProjectInfoFeatureInterface
import FileDomainInterface
import ConcurrencyUtil

final class InputProjectInfoIntent: InputProjectInfoIntentProtocol {
    private weak var model: (any InputProjectInfoActionProtocol)?
    private weak var delegate: (any InputProjectInfoDelegate)?
    private let imageUploadUseCase: any ImageUploadUseCase

    init(
        model: any InputProjectInfoActionProtocol,
        delegate: any InputProjectInfoDelegate,
        imageUploadUseCase: any ImageUploadUseCase
    ) {
        self.model = model
        self.delegate = delegate
        self.imageUploadUseCase = imageUploadUseCase
    }

    func prevButtonDidTap() {
        delegate?.projectInfoPrevButtonDidTap()
    }

    func nextButtonDidTap(projects: [ProjectInfo]) {
        Task {
            let projectInfoObjects = try await projects.concurrentMap {
                var iconImage: InputProjectInfoObject.ImageFile?

                if let unwrapIconImage = $0.iconImage {
                    async let image = self.imageUploadUseCase.execute(
                        image: unwrapIconImage.uiImage.jpegData(compressionQuality: 0.2) ?? .init(),
                        fileName: unwrapIconImage.fileName
                    )

                    iconImage = try await InputProjectInfoObject.ImageFile(
                        name: unwrapIconImage.fileName,
                        url: image,
                        data: unwrapIconImage.uiImage.jpegData(compressionQuality: 0.2) ?? .init()
                    )
                } else {
                    iconImage = nil
                }

                let previewImages = try await $0.previewImages.concurrentMap {
                    async let previewImageURL = self.imageUploadUseCase.execute(
                        image: $0.uiImage.jpegData(compressionQuality: 0.2) ?? .init(),
                        fileName: $0.fileName
                    )
                    return try await InputProjectInfoObject.ImageFile(
                        name: $0.fileName,
                        previewImageUrl: previewImageURL,
                        data: $0.uiImage.jpegData(compressionQuality: 0.2) ?? .init()
                    )
                }

                let relatedLinks = $0.relatedLinks
                    .filter { $0.name.isNotEmpty && $0.url.isNotEmpty }
                    .map { InputProjectInfoObject.RelatedLink(name: $0.name, url: $0.url) }

                return InputProjectInfoObject(
                    name: $0.name,
                    iconImage: iconImage,
                    previewImages: previewImages,
                    content: $0.content,
                    techStacks: Array($0.techStacks),
                    mainTask: $0.mainTask,
                    startAt: $0.startAt,
                    endAt: $0.isInProgress ? nil : $0.endAt,
                    relatedLinks: relatedLinks
                )
            }
            delegate?.completeToInputProjectInfo(input: projectInfoObjects)
        }
    }

    func projectToggleButtonDidTap(index: Int) {
        model?.toggleCollapsedProject(index: index)
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

    func removeProjectTechStackButtonDidTap(index: Int, techStack: String) {
        model?.removeProjectTechStack(index: index, techStack: techStack)
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

    func techStackAppendButtonDidTap(index: Int) {
        model?.updateFocusedProjectIndex(index: index)
        model?.updateIsPresentedTechStackAppend(isPresented: true)
    }

    func techStackAppendDismissed() {
        model?.updateIsPresentedTechStackAppend(isPresented: false)
    }
}
