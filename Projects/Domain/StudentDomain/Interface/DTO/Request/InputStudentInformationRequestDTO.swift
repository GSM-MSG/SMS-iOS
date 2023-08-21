import Foundation

public struct InputStudentInformationRequestDTO: Encodable {
    public let certificate: [String]
    public let contactEmail: String
    public let formOfEmployment: FormOfEmployment
    public let gsmAuthenticationScore: Int
    public let introduce: String
    public let languageCertificate: [LanguageCertificate]
    public let major: String
    public let militaryService: MilitaryServiceType
    public let portfolioURL: String
    public let profileImgURL: String
    public let region: [String]
    public let salary: Int
    public let techStack: [String]
    public let projects: [Project]
    public let prizes: [Prize]

    public init(
        certificate: [String],
        contactEmail: String,
        formOfEmployment: FormOfEmployment,
        gsmAuthenticationScore: Int,
        introduce: String,
        languageCertificate: [LanguageCertificate],
        major: String,
        militaryService: MilitaryServiceType,
        portfolioURL: String,
        profileImgURL: String,
        region: [String],
        salary: Int,
        techStack: [String],
        projects: [Project] = [],
        prizes: [Prize] = []
    ) {
        self.certificate = certificate
        self.contactEmail = contactEmail
        self.formOfEmployment = formOfEmployment
        self.gsmAuthenticationScore = gsmAuthenticationScore
        self.introduce = introduce
        self.languageCertificate = languageCertificate
        self.major = major
        self.militaryService = militaryService
        self.portfolioURL = portfolioURL
        self.profileImgURL = profileImgURL
        self.region = region
        self.salary = salary
        self.techStack = techStack
        self.projects = projects
        self.prizes = prizes
    }

    enum CodingKeys: String, CodingKey {
        case certificate
        case contactEmail
        case formOfEmployment
        case gsmAuthenticationScore
        case introduce
        case languageCertificate
        case major
        case militaryService
        case portfolioURL = "portfolioUrl"
        case profileImgURL = "profileImgUrl"
        case region
        case salary
        case techStack
        case projects
        case prizes
    }
}

public extension InputStudentInformationRequestDTO {
    struct LanguageCertificate: Encodable {
        public let languageCertificateName: String
        public let score: String

        public init(languageCertificateName: String, score: String) {
            self.languageCertificateName = languageCertificateName
            self.score = score
        }
    }

    struct Project: Encodable {
        public let name: String
        public let iconImageURL: String
        public let previewImageURLs: [String]
        public let description: String
        public let links: [Link]
        public let techStacks: [String]
        public let myActivity: String
        public let inProgress: InProgress

        public init(
            name: String,
            iconImageURL: String,
            previewImageURLs: [String],
            description: String,
            links: [Link],
            techStacks: [String],
            myActivity: String,
            inProgress: InProgress
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
