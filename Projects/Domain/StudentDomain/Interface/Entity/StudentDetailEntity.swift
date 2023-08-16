import Foundation

public struct StudentDetailEntity: Equatable {
    public let name: String
    public let introduce: String
    public let major: String
    public let profileImageURL: String
    public let techStacks: [String]
    public let projects: [ProjectEntity]
    public let prizes: [PrizeEntity]
    public let detailInfoByStudent: DetailInfoByStudent?
    public let detailInfoByTeacher: DetailInfoByTeacher?

    public init(
        name: String,
        introduce: String,
        major: String,
        profileImageURL: String,
        techStacks: [String],
        projects: [ProjectEntity],
        prizes: [PrizeEntity],
        detailInfoByStudent: DetailInfoByStudent? = nil,
        detailInfoByTeacher: DetailInfoByTeacher? = nil
    ) {
        self.name = name
        self.introduce = introduce
        self.major = major
        self.profileImageURL = profileImageURL
        self.techStacks = techStacks
        self.projects = projects
        self.prizes = prizes
        self.detailInfoByStudent = detailInfoByStudent
        self.detailInfoByTeacher = detailInfoByTeacher
    }
}

extension StudentDetailEntity {
    public struct DetailInfoByStudent: Equatable {
        public let grade: Int
        public let `class`: Int
        public let number: Int
        public let department: DepartmentType

        public init(grade: Int, class: Int, number: Int, department: DepartmentType) {
            self.grade = grade
            self.class = `class`
            self.number = number
            self.department = department
        }
    }

    public struct DetailInfoByTeacher: Equatable {
        public let portfolioURL: String?
        public let grade: Int
        public let `class`: Int
        public let number: Int
        public let department: DepartmentType
        public let contactEmail: String
        public let gsmAuthenticationScore: Int
        public let formOfEmployment: FormOfEmployment
        public let regions: [String]
        public let militaryService: MilitaryServiceType
        public let salary: Int
        public let languageCertificate: [LanguageCertificateEntity]
        public let certificate: [String]

        public init(
            portfolioURL: String?,
            grade: Int,
            class: Int,
            number: Int,
            department: DepartmentType,
            contactEmail: String,
            gsmAuthenticationScore: Int,
            formOfEmployment: FormOfEmployment,
            regions: [String],
            militaryService: MilitaryServiceType,
            salary: Int,
            languageCertificate: [LanguageCertificateEntity],
            certificate: [String]
        ) {
            self.portfolioURL = portfolioURL
            self.grade = grade
            self.class = `class`
            self.number = number
            self.department = department
            self.contactEmail = contactEmail
            self.gsmAuthenticationScore = gsmAuthenticationScore
            self.formOfEmployment = formOfEmployment
            self.regions = regions
            self.militaryService = militaryService
            self.salary = salary
            self.languageCertificate = languageCertificate
            self.certificate = certificate
        }
    }
}
