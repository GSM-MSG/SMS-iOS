import Foundation
import FilterFeatureInterface
import StudentDomainInterface

public struct FilterOption {
    public let majors: [String]?
    public let techStacks: [String]?
    public let grade: Int?
    public let classNum: Int?
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
        dto: FilterOptionDTO
    ) {
        self.majors = dto.majors
        self.techStacks = dto.techStacks
        self.grade = dto.grade
        self.classNum = dto.classNum
        self.department = dto.department
        self.stuNumSort = dto.stuNumSort
        self.formOfEmployment = dto.formOfEmployment
        self.minGsmAuthenticationScore = dto.minGsmAuthenticationScore
        self.maxGsmAuthenticationScore = dto.maxGsmAuthenticationScore
        self.gsmAuthenticationScoreSort = dto.gsmAuthenticationScoreSort
        self.minSalary = dto.minSalary
        self.maxSalary = dto.maxSalary
        self.salarySort = dto.salarySort
    }
}

extension FilterOption {
    func toRequestDTO(page: Int, size: Int) -> FetchStudentListRequestDTO {
        .init(
            page: page,
            size: size,
            majors: majors,
            techStacks: techStacks,
            grade: grade,
            classNum: classNum,
            department: department,
            stuNumSort: stuNumSort,
            formOfEmployment: formOfEmployment,
            minGsmAuthenticationScore: minGsmAuthenticationScore,
            maxGsmAuthenticationScore: maxGsmAuthenticationScore,
            gsmAuthenticationScoreSort: gsmAuthenticationScoreSort,
            minSalary: minSalary,
            maxSalary: maxSalary,
            salarySort: salarySort
        )
    }
}
