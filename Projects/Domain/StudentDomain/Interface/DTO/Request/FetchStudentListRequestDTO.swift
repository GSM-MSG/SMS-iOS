import Foundation

public struct FetchStudentListRequestDTO: Encodable {
    public let page: Int
    public let size: Int
    public let majors: [String]?
    public let techStacks: [String]?
    public let grade: [Int]?
    public let classNum: [Int]?
    public let department: [String]?
    public let stuNumSort: SortType?
    public let formOfEmployment: [String]?
    public let minGsmAuthenticationScore: Int?
    public let maxGsmAuthenticationScore: Int?
    public let gsmAuthenticationScoreSort: SortType?
    public let minSalary: Int?
    public let maxSalary: Int?
    public let salarySort: SortType?

    public init(
        page: Int,
        size: Int,
        majors: [String]? = nil,
        techStacks: [String]? = nil,
        grade: [Int]? = nil,
        classNum: [Int]? = nil,
        department: [String]? = nil,
        stuNumSort: SortType? = nil,
        formOfEmployment: [String]? = nil,
        minGsmAuthenticationScore: Int? = nil,
        maxGsmAuthenticationScore: Int? = nil,
        gsmAuthenticationScoreSort: SortType? = nil,
        minSalary: Int? = nil,
        maxSalary: Int? = nil,
        salarySort: SortType? = nil
    ) {
        self.page = page
        self.size = size
        self.majors = majors
        self.techStacks = techStacks
        self.grade = grade
        self.classNum = classNum
        self.department = department
        self.stuNumSort = stuNumSort
        self.formOfEmployment = formOfEmployment
        self.minGsmAuthenticationScore = minGsmAuthenticationScore
        self.maxGsmAuthenticationScore = maxGsmAuthenticationScore
        self.gsmAuthenticationScoreSort = gsmAuthenticationScoreSort
        self.minSalary = minSalary
        self.maxSalary = maxSalary
        self.salarySort = salarySort
    }
}
