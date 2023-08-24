import Foundation
import StudentDomainInterface
import UserDomainInterface

struct FetchMyProfileResponseDTO: Decodable {
    let name: String
    let introduce: String
    let portfolioURL: String
    let grade: Int
    let classNum: Int
    let number: Int
    let department: DepartmentType
    let major: String
    let profileImageURL: String
    let contactEmail: String
    let gsmAuthenticationScore: Int
    let formOfEmployment: FormOfEmployment
    let regions: [String]
    let militaryService: MilitaryServiceType
    let salary: Int
    let languageCertificates: [LanguageCertificateResponseDTO]
    let certificates: [String]
    let techStacks: [String]
    let projects: [ProjectResponseDTO]
    let prizes: [PrizeResponseDTO]

    enum CodingKeys: String, CodingKey {
        case name
        case introduce
        case portfolioURL = "portfolioUrl"
        case grade
        case classNum
        case number
        case department
        case major
        case profileImageURL = "profileImg"
        case contactEmail
        case gsmAuthenticationScore
        case formOfEmployment
        case regions
        case militaryService
        case salary
        case languageCertificates
        case certificates
        case techStacks
        case projects
        case prizes
    }
}

extension FetchMyProfileResponseDTO {
    struct LanguageCertificateResponseDTO: Decodable {
        let name: String
        let score: String

        enum CodingKeys: String, CodingKey {
            case name = "languageCertificateName"
            case score
        }
    }

    struct ProjectResponseDTO: Decodable {
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

    struct PrizeResponseDTO: Decodable {
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

extension FetchMyProfileResponseDTO.ProjectResponseDTO {
    struct Link: Decodable {
        public let name: String
        public let url: String

        public init(name: String, url: String) {
            self.name = name
            self.url = url
        }
    }

    struct InProgress: Decodable {
        public let start: String
        public let end: String?

        public init(start: String, end: String?) {
            self.start = start
            self.end = end
        }
    }
}


extension FetchMyProfileResponseDTO.LanguageCertificateResponseDTO {
    func toDomain() -> LanguageCertificateEntity {
        LanguageCertificateEntity(name: name, score: score)
    }
}

extension FetchMyProfileResponseDTO.ProjectResponseDTO {
    func toDomain() -> ProjectEntity {
        ProjectEntity(
            name: name,
            iconImageURL: iconImageURL,
            previewImageURLs: previewImageURLs,
            description: description,
            links: links.map { $0.toDomain() },
            techStacks: techStacks,
            myActivity: myActivity,
            inProgress: inProgress.toDomain()
        )
    }
}

extension FetchMyProfileResponseDTO.PrizeResponseDTO {
    func toDomain() -> PrizeEntity {
        PrizeEntity(name: name, type: type, date: date)
    }
}

extension FetchMyProfileResponseDTO.ProjectResponseDTO.Link {
    func toDomain() -> ProjectEntity.LinkEntity {
        ProjectEntity.LinkEntity(name: name, url: url)
    }
}

extension FetchMyProfileResponseDTO.ProjectResponseDTO.InProgress {
    func toDomain() -> ProjectEntity.InProgressEntity {
        ProjectEntity.InProgressEntity(start: start, end: end)
    }
}

extension FetchMyProfileResponseDTO {
    func toDomain() -> MyPageEntity {
        MyPageEntity(
            name: name,
            introduce: introduce,
            portfolioURL: portfolioURL,
            grade: grade,
            classNum: classNum,
            number: number,
            department: department,
            major: major,
            profileImageURL: profileImageURL,
            contactEmail: contactEmail,
            gsmAuthenticationScore: gsmAuthenticationScore,
            formOfEmployment: formOfEmployment,
            regions: regions,
            militaryService: militaryService,
            salary: salary,
            languageCertificates: languageCertificates.map { $0.toDomain() },
            certificates: certificates,
            techStacks: techStacks,
            projects: projects.map { $0.toDomain() },
            prizes: prizes.map { $0.toDomain() }
        )
    }
}
