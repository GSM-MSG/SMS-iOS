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

    public init(
        name: String,
        iconImage: ImageFile?,
        previewImages: [ImageFile],
        content: String,
        techStacks: [String],
        mainTask: String,
        startAt: Date,
        endAt: Date?,
        relatedLinks: [RelatedLink]
    ) {
        self.name = name
        self.iconImage = iconImage
        self.previewImages = previewImages
        self.content = content
        self.techStacks = techStacks
        self.mainTask = mainTask
        self.startAt = startAt
        self.endAt = endAt
        self.relatedLinks = relatedLinks
    }
}

public extension InputProjectInfoObject {
    struct ImageFile {
        public let name: String
        public let data: Data

        public init(name: String, data: Data) {
            self.name = name
            self.data = data
        }
    }

    struct RelatedLink {
        public let name: String
        public let url: String

        public init(name: String, url: String) {
            self.name = name
            self.url = url
        }
    }
}
