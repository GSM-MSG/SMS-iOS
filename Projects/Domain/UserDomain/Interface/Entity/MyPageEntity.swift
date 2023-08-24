import Foundation
import StudentDomainInterface

public struct MyPageEntity: Equatable {
    public let name: String
    public let introduce: String
    public let portfolioURL: String
    public let grade: Int
    public let classNum: Int
    public let number: Int
    public let department: DepartmentType
    public let major: String
    public let profileImageURL: String
    public let contactEmail: String
    public let gsmAuthenticationScore: Int
    public let formOfEmployment: FormOfEmployment
    public let regions: [String]
    public let militaryService: MilitaryServiceType
    public let salary: Int
    public let languageCertificates: [LanguageCertificateEntity]
    public let certificates: [String]
    public let techStacks: [String]
    public let proejcts: [ProjectEntity]
    public let prizes: [PrizeEntity]

    public init(
        name: String,
        introduce: String,
        portfolioURL: String,
        grade: Int,
        classNum: Int,
        number: Int,
        department: DepartmentType,
        major: String,
        profileImageURL: String,
        contactEmail: String,
        gsmAuthenticationScore: Int,
        formOfEmployment: FormOfEmployment,
        regions: [String],
        militaryService: MilitaryServiceType,
        salary: Int,
        languageCertificates: [LanguageCertificateEntity],
        certificates: [String],
        techStacks: [String],
        projects: [ProjectEntity],
        prizes: [PrizeEntity]
    ) {
        self.name = name
        self.introduce = introduce
        self.portfolioURL = portfolioURL
        self.grade = grade
        self.classNum = classNum
        self.number = number
        self.department = department
        self.major = major
        self.profileImageURL = profileImageURL
        self.contactEmail = contactEmail
        self.gsmAuthenticationScore = gsmAuthenticationScore
        self.formOfEmployment = formOfEmployment
        self.regions = regions
        self.militaryService = militaryService
        self.salary = salary
        self.languageCertificates = languageCertificates
        self.certificates = certificates
        self.techStacks = techStacks
        self.proejcts = projects
        self.prizes = prizes
    }
}
