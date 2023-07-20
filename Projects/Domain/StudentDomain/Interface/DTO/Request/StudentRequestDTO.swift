import Foundation

public struct InputStudentInformationRequestDTO: Encodable {
    public let certificate: [String]
    public let contactEmail: String
    public let dreamBookFileURL: String
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
        dreamBookFileURL: String,
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
        self.dreamBookFileURL = dreamBookFileURL
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
        case dreamBookFileURL = "dreamBookFileUrl"
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
    }
}

public extension InputStudentInformationRequestDTO.Project {
    struct Link: Encodable {
        public let name: String
        public let url: String
    }

    struct InProgress: Encodable {
        public let start: String
        public let end: String?
    }
}
