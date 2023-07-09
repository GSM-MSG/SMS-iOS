import DateUtil
import Foundation

struct ProjectInfo {
    var name: String
    var iconImage: Data?
    var previewImages: [Data]
    var content: String
    var techStacks: [String]
    var mainTask: String
    var startAt: Date
    var endAt: Date?
    var relatedLinks: [RelatedLink]

    var startAtString: String {
        startAt.toStringCustomFormat(format: "yyyy.MM")
    }
    var endAtString: String {
        endAt?.toStringCustomFormat(format: "yyyy.MM") ?? ""
    }
}

extension ProjectInfo {
    struct RelatedLink {
        var name: String
        var url: String
    }
}

enum InputProjectInfoErrorField: Hashable {
    case name
    case content
    case mainTask
}

protocol InputProjectInfoStateProtocol {
    var projectList: [ProjectInfo] { get }
    var projectErrorSetList: [Set<InputProjectInfoErrorField>] { get }
}

protocol InputProjectInfoActionProtocol: AnyObject {
    func updateProjectName(index: Int, name: String)
    func updateIconImage(index: Int, data: Data)
    func appendPreviewImage(index: Int, data: Data)
    func removePreviewImage(index: Int, previewIndex: Int)
    func updateProjectContent(index: Int, content: String)
    func updateProjectTechStacks(index: Int, techStacks: [String])
    func updateProjectMainTask(index: Int, mainTask: String)
    func updateProjectStartAt(index: Int, startAt: Date)
    func updateProjectEndAt(index: Int, endAt: Date)
    func updateProjectLinkName(index: Int, linkIndex: Int, name: String)
    func updateProjectLinkURL(index: Int, linkIndex: Int, url: String)
    func appendEmptyRelatedLink(index: Int)
    func removeProjectRelatedLink(index: Int, linkIndex: Int)
    func appendEmptyProject()
}
