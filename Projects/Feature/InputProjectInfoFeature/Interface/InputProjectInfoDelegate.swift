import Foundation

public protocol InputProjectInfoDelegate: AnyObject {
    func projectInfoPrevButtonDidTap()
    func completeToInputProjectInfo(input: [InputProjectInfoObject])
}

public struct InputProjectInfoObject {
    public let name: String
    public let iconImage: ImageFile?
    public let previewImages: [ImageFile]
    public let content: String
    public let techStacks: [String]
    public let mainTask: String
    public let startAt: Date
    public let endAt: Date?
    public let relatedLinks: [RelatedLink]
}

public extension InputProjectInfoObject {
    struct ImageFile {
        public let name: String
        public let data: Data
    }

    struct RelatedLink {
        public let name: String
        public let url: String
    }
}
