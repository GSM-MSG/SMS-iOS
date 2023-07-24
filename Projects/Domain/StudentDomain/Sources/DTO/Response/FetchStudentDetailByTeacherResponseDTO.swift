import StudentDomainInterface
import Foundation

public struct FetchStudentDetailByTeacherResponseDTO: Decodable {
    public let name: String
    public let introduce: String
    public let dreamBookFileUrl: String?
    public let portfolioUrl: String?
    public let grade: Int
    public let classNum: Int
    public let number: Int
    public let department: DepartmentType
    public let major: String
    public let profileImg: String
    public let contactEmail: String
    public let gsmAuthenticationScore: Int
    public let formOfEmployment: FormOfEmployment
    public let regions: [String]
    public let militaryService: MilitaryServiceType
    public let salary: Int
    public let languageCertificates: [LanguageCertificateResponseDTO]
    public let certificates: [String]
    public let techStacks: [String]
    public let projects: [ProjectResponseDTO]
    public let prizes: [PrizeResponseDTO]

    public struct LanguageCertificateResponseDTO: Decodable {
        public let name: String
        public let score: String

        // swiftlint: disable nesting
        enum CodingKeys: String, CodingKey {
            case name = "languageCertificateName"
            case score
        }
        // swiftlint: enable nesting
    }

    public struct ProjectResponseDTO: Decodable {
        public let name: String
        public let iconImageURL: String
        public let previewImageURLs: [String]
        public let description: String
        public let links: [LinkResponseDTO]
        public let techStacks: [String]
        public let myActivity: String
        public let inProgress: InProgressResponseDTO

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

    public struct PrizeResponseDTO: Decodable {
        public let name: String
        public let type: String
        public let date: String
    }

    public struct LinkResponseDTO: Decodable {
        public let name: String
        public let url: String
    }

    public struct InProgressResponseDTO: Decodable {
        public let start: String
        public let end: String?
    }
}

public extension FetchStudentDetailByTeacherResponseDTO.LanguageCertificateResponseDTO {
    func toDomain() -> LanguageCertificateEntity {
        LanguageCertificateEntity(name: name, score: score)
    }
}

public extension FetchStudentDetailByTeacherResponseDTO.ProjectResponseDTO {
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

public extension FetchStudentDetailByTeacherResponseDTO.LinkResponseDTO {
    func toDomain() -> ProjectEntity.LinkEntity {
        ProjectEntity.LinkEntity(name: name, url: url)
    }
}

public extension FetchStudentDetailByTeacherResponseDTO.InProgressResponseDTO {
    func toDomain() -> ProjectEntity.InProgressEntity {
        .init(start: start, end: end)
    }
}

public extension FetchStudentDetailByTeacherResponseDTO.PrizeResponseDTO {
    func toDomain() -> PrizeEntity {
        PrizeEntity(name: name, type: type, date: date)
    }
}

public extension FetchStudentDetailByTeacherResponseDTO {
    func toDomain() -> StudentDetailEntity {
        StudentDetailEntity(
            name: name,
            introduce: introduce,
            major: major,
            profileImageURL: profileImg,
            techStacks: techStacks,
            detailInfoByTeacher: .init(
                dreamBookFileURL: dreamBookFileUrl,
                portfolioURL: portfolioUrl,
                grade: grade,
                class: classNum,
                number: number,
                department: department,
                contactEmail: contactEmail,
                gsmAuthenticationScore: gsmAuthenticationScore,
                formOfEmployment: formOfEmployment,
                regions: regions,
                militaryService: militaryService,
                salary: salary,
                languageCertificate: languageCertificates.map { $0.toDomain() },
                certificate: certificates,
                projects: projects.map { $0.toDomain() },
                prizes: prizes.map { $0.toDomain() }
            )
        )
    }
}
