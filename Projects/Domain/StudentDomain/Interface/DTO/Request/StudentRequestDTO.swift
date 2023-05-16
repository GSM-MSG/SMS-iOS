import Foundation

public struct StudentRequestDTO: Codable {
    let certificate: [String]
    let contactEmail: String
    let dreamBookFileUrl: String
    let formOfEmployment: String
    let gsmAuthenticationScore: Int
    let introduce: String
    let languageCertificate: [LanguageCertificate]
    let major: String
    let militaryService: String
    let portfolioUrl: String
    let profileImgUrl: String
    let region: [String]
    let salary: Int
    let stuNum: String
    let techStack: [String]

    init(
        certificate: [String],
        contactEmail: String,
        dreamBookFileUrl: String,
        formOfEmployment: String,
        gsmAuthenticationScore: Int,
        introduce: String,
        languageCertificate: [LanguageCertificate],
        major: String,
        militaryService: String,
        portfolioUrl: String,
        profileImgUrl: String,
        region: [String],
        salary: Int,
        stuNum: String,
        techStack: [String]
    ) {
        self.certificate = certificate
        self.contactEmail = contactEmail
        self.dreamBookFileUrl = dreamBookFileUrl
        self.formOfEmployment = formOfEmployment
        self.gsmAuthenticationScore = gsmAuthenticationScore
        self.introduce = introduce
        self.languageCertificate = languageCertificate
        self.major = major
        self.militaryService = militaryService
        self.portfolioUrl = portfolioUrl
        self.profileImgUrl = profileImgUrl
        self.region = region
        self.salary = salary
        self.stuNum = stuNum
        self.techStack = techStack
    }

    struct LanguageCertificate: Codable {
        enum CodingKeys: String, CodingKey, CaseIterable {
            case languageCertificateName
            case score
        }

        let languageCertificateName: String
        let score: String

        init(languageCertificateName: String, score: String) {
            self.languageCertificateName = languageCertificateName
            self.score = score
        }
    }
}
