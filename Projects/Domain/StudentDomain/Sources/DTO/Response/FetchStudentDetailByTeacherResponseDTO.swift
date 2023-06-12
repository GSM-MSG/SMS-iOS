import StudentDomainInterface
import Foundation

public struct FetchStudentDetailByTeacherResponseDTO: Decodable {
    public let name: String
    public let introduce: String
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
    public let languageCertificate: [LanguageCertificateResponseDTO]
    public let certificate: [String]
    public let techStack: [String]

    public struct LanguageCertificateResponseDTO: Decodable {
        public let name: String
        public let score: String
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
            techStacks: techStack,
            detailInfoByTeacher: .init(
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
                languageCertificate: languageCertificate.map { $0.toDomain() },
                certificate: certificate
            )
        )
    }
}
