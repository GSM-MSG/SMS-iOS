import Foundation

struct ProjectInfo {
    let name: String
    let iconImage: Data
    let previewImages: [Data]
    let content: String
    let techStacks: [String]
    let mainTask: String
    let startAt: Date
    let endAt: Date?
    let relatedLinks: [RelatedLink]
}

extension ProjectInfo {
    struct RelatedLink {
        let name: String
        let url: String
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
    
}
