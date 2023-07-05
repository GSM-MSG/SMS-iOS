import Foundation
import UserDomainInterface
import StudentDomainInterface

final class FilterModel: ObservableObject, FilterStateProtocol {
    @Published var userRole: UserRoleType = .guest
    @Published var isError: Bool = false
    @Published var isPresentedTechStackAppend: Bool = false
    @Published var techStacks: [String] = []
    @Published var isLoading: Bool = false
    @Published var gradeSet: Set<GradeType> = []
    @Published var classSet: Set<ClassType> = []
    @Published var departmentSet: Set<DepartmentType> = []
    @Published var majorSet: Set<String> = []
    @Published var majorList: [String] = []
    @Published var formOfEmploymentSet: Set<FormOfEmployment> = []
    @Published var lowerScoreValue: Int = 0
    @Published var upperScoreValue: Int = 2000
    @Published var lowerSalaryValue: Int = 0
    @Published var upperSalaryValue: Int = 9999
    @Published var stuNumSortType: SortType = .asc
    @Published var scoreSortType: SortType = .asc
    @Published var salarySortType: SortType = .asc
}

extension FilterModel: FilterActionProtocol {
    func updateIsError(isError: Bool) {
        self.isError = isError
    }

    func updateIsPresentedTeckStackAppend(isPresented: Bool) {
        self.isPresentedTechStackAppend = isPresented
    }

    func updateTeckStacks(techStacks: [String]) {
        self.techStacks = techStacks
    }

    func updateIsLoading(isLoading: Bool) {
        self.isLoading = isLoading
    }

    func updateUserRole(role: UserRoleType) {
        self.userRole = role
    }

    func updateLowerScoreValue(lowerValue: Int) {
        self.lowerScoreValue = lowerValue
    }

    func updateUpperScoreValue(upperValue: Int) {
        self.upperScoreValue = upperValue
    }

    func updateLowerSalaryValue(lowerValue: Int) {
        self.lowerSalaryValue = lowerValue
    }

    func updateUpperSalaryValue(upperValue: Int) {
        self.upperSalaryValue = upperValue
    }

    func updpateMajorList(majorList: [String]) {
        self.majorList = majorList
    }

    func insertGrade(grade: GradeType) {
        self.gradeSet.insert(grade)
    }

    func removeGrade(grade: GradeType) {
        self.gradeSet.remove(grade)
    }

    func insertClass(class: ClassType) {
        self.classSet.insert(`class`)
    }

    func removeClass(class: ClassType) {
        self.classSet.remove(`class`)
    }

    func insertDepartment(department: DepartmentType) {
        self.departmentSet.insert(department)
    }

    func removeDepartment(department: DepartmentType) {
        self.departmentSet.remove(department)
    }

    func insertMajor(major: String) {
        self.majorSet.insert(major)
    }

    func removeMajor(major: String) {
        self.majorSet.remove(major)
    }

    func insertFormOfEmployment(formOfEmployment: FormOfEmployment) {
        self.formOfEmploymentSet.insert(formOfEmployment)
    }

    func removeFormOfEmployment(formOfEmployment: FormOfEmployment) {
        self.formOfEmploymentSet.remove(formOfEmployment)
    }

    func insertStuNumSortType(stuNumSortType: SortType) {
        self.stuNumSortType = stuNumSortType
    }

    func insertScoreSortType(scoreSortType: SortType) {
        self.scoreSortType = scoreSortType
    }

    func insertSalarySortType(salarySortType: SortType) {
        self.salarySortType = salarySortType
    }
}
