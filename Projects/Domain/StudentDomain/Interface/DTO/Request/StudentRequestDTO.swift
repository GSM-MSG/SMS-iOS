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
    public let militaryService: MilitaryService
    public let portfolioURL: String
    public let profileImgURL: String
    public let region: [String]
    public let salary: Int
    public let stuNum: String
    public let techStack: [String]

    public init(
        certificate: [String],
        contactEmail: String,
        dreamBookFileURL: String,
        formOfEmployment: FormOfEmployment,
        gsmAuthenticationScore: Int,
        introduce: String,
        languageCertificate: [LanguageCertificate],
        major: String,
        militaryService: MilitaryService,
        portfolioURL: String,
        profileImgURL: String,
        region: [String],
        salary: Int,
        stuNum: String,
        techStack: [String]
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
        self.stuNum = stuNum
        self.techStack = techStack
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
        case stuNum
        case techStack
    }

    public struct LanguageCertificate: Encodable {
        public let languageCertificateName: String
        public let score: String

        public init(languageCertificateName: String, score: String) {
            self.languageCertificateName = languageCertificateName
            self.score = score
        }
    }
}
