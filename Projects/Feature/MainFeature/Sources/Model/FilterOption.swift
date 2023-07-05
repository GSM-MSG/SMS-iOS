import Foundation
import FilterFeatureInterface
import StudentDomainInterface

struct FilterOption {
    let majors: [String]?
    let techStacks: [String]?
    let grade: [Int]?
    let classNum: [Int]?
    let department: [String]?
    let stuNumSort: SortType?
    let formOfEmployment: [String]?
    let minGsmAuthenticationScore: Int?
    let maxGsmAuthenticationScore: Int?
    let gsmAuthenticationScoreSort: SortType?
    let minSalary: Int?
    let maxSalary: Int?
    let salarySort: SortType?

    init(
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
