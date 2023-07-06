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
}

extension FetchMyProfileResponseDTO.LanguageCertificateResponseDTO {
    func toDomain() -> LanguageCertificateEntity {
        LanguageCertificateEntity(name: name, score: score)
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
            techStacks: techStacks
        )
    }
}
