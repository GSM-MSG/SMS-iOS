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
}

public extension FetchStudentDetailByTeacherResponseDTO.LanguageCertificateResponseDTO {
    func toDomain() -> LanguageCertificateEntity {
        LanguageCertificateEntity(name: name, score: score)
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
            projects: projects.map { $0.toDomain() },
            prizes: prizes.map { $0.toDomain() },
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
                certificate: certificates
            )
        )
    }
}
