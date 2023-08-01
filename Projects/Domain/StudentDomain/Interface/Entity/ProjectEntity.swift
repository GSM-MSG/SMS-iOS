public struct ProjectEntity: Equatable, Hashable {
    public let name: String
    public let iconImageURL: String
    public let previewImageURLs: [String]
    public let description: String
    public let links: [LinkEntity]
    public let techStacks: [String]
    public let myActivity: String
    public let inProgress: InProgressEntity

    public init(
        name: String,
        iconImageURL: String,
        previewImageURLs: [String],
        description: String,
        links: [LinkEntity],
        techStacks: [String],
        myActivity: String,
        inProgress: InProgressEntity
    ) {
        self.name = name
        self.iconImageURL = iconImageURL
        self.previewImageURLs = previewImageURLs
        self.description = description
        self.links = links
        self.techStacks = techStacks
        self.myActivity = myActivity
        self.inProgress = inProgress
    }
}

public extension ProjectEntity {
    struct LinkEntity: Equatable, Hashable {
        public let name: String
        public let url: String

        public init(name: String, url: String) {
            self.name = name
            self.url = url
        }
    }

    struct InProgressEntity: Equatable, Hashable {
        public let start: String
        public let end: String?

        public init(start: String, end: String?) {
            self.start = start
            self.end = end
        }
    }
}
