import Foundation

protocol InputProjectInfoIntentProtocol {
    func updateProjectName(index: Int, name: String)
    func updateIconImage(index: Int, data: Data)
    func appendPreviewImage(index: Int, data: Data)
    func removePreviewImageDidTap(index: Int, previewIndex: Int)
    func updateProjectContent(index: Int, content: String)
    func techStacksDidSelect(index: Int, techStacks: [String])
    func updateProjectMainTask(index: Int, mainTask: String)
    func projectStartAtDidSelect(index: Int, startAt: Date)
    func projectEndAtDidSelect(index: Int, endAt: Date)
    func updateProjectLinkName(index: Int, linkIndex: Int, name: String)
    func updateProjectLinkURL(index: Int, linkIndex: Int, url: String)
    func removeProjectRelatedLinkDidTap(index: Int, linkIndex: Int)
}
