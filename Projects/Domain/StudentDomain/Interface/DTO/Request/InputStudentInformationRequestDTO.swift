import Foundation

public struct InputStudentInformationRequestDTO: Encodable {
    public let contactEmail: String
    public let introduce: String
    public let major: String
    public let profileImgURL: String
    public let regions: [String]
    public let salary: Int
    public let techStacks: [String]
    public let projects: [Project]
    public let prizes: [Prize]

    public init(
        contactEmail: String,
        introduce: String,
        major: String,
        profileImgURL: String,
        regions: [String],
        salary: Int,
        techStacks: [String],
        projects: [Project] = [],
        prizes: [Prize] = []
    ) {
        self.contactEmail = contactEmail
        self.introduce = introduce
        self.major = major
        self.profileImgURL = profileImgURL
        self.regions = regions
        self.salary = salary
        self.techStacks = techStacks
        self.projects = projects
        self.prizes = prizes
    }

    enum CodingKeys: String, CodingKey {
        case contactEmail
        case introduce
        case major
        case profileImgURL = "profileImgUrl"
        case regions
        case salary
        case techStacks
        case projects
        case prizes
    }
}

public extension InputStudentInformationRequestDTO {
    struct Project: Encodable {
        public let name: String
        public let iconImageURL: String
        public let description: String
        public let links: [Link]
        public let techStacks: [String]
        public let myActivity: String
        public let inProgress: InProgress

        public init(
            name: String,
            iconImageURL: String,
            description: String,
            links: [Link],
            techStacks: [String],
            myActivity: String,
            inProgress: InProgress
        ) {
            self.name = name
            self.iconImageURL = iconImageURL
            self.description = description
            self.links = links
            self.techStacks = techStacks
            self.myActivity = myActivity
            self.inProgress = inProgress
        }

        enum CodingKeys: String, CodingKey {
            case name
            case iconImageURL = "icon"
            case description
            case links
            case techStacks
            case myActivity
            case inProgress
        }
    }

    struct Prize: Encodable {
        public let name: String
        public let type: String
        public let date: String

        public init(
            name: String,
            type: String,
            date: String
        ) {
            self.name = name
            self.type = type
            self.date = date
        }
    }
}

public extension InputStudentInformationRequestDTO.Project {
    struct Link: Encodable {
        public let name: String
        public let url: String

        public init(name: String, url: String) {
            self.name = name
            self.url = url
        }
    }

    struct InProgress: Encodable {
        public let start: String
        public let end: String?

        public init(start: String, end: String?) {
            self.start = start
            self.end = end
        }
    }
}
