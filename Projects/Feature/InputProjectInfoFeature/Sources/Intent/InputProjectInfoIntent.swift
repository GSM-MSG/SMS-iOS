import Foundation

final class InputProjectInfoIntent: InputProjectInfoIntentProtocol {
    private weak var model: (any InputProjectInfoActionProtocol)?

    init(model: any InputProjectInfoActionProtocol) {
        self.model = model
    }

    func updateProjectName(index: Int, name: String) {
        model?.updateProjectName(index: index, name: name)
    }

    func updateIconImage(index: Int, data: Data) {
        model?.updateIconImage(index: index, data: data)
    }

    func appendPreviewImage(index: Int, data: Data) {
        model?.appendPreviewImage(index: index, data: data)
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
}
