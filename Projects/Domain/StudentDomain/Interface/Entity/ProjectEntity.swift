public struct ProjectEntity: Equatable {
    public let name: String
    public let iconImageURL: String
    public let previewImageURLs: [String]
    public let description: String
    public let links: [LinkEntity]
    public let techStacks: [String]
    public let myActivity: String
    public let inProgress: InProgressEntity

    enum CodingKeys: String, CodingKey {
        case name
        case iconImageURL = "icon"
        case previewImageURLs = "previewImages"
        case description
        case links
        case techStacks
        case myActivity
        case inProgress
    }

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
    struct LinkEntity: Equatable {
        public let name: String
        public let url: String
    }

    struct InProgressEntity: Equatable {
        public let start: String
        public let end: String?
    }
}
