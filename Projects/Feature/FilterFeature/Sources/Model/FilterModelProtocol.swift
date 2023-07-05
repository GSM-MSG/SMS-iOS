import UserDomainInterface
import StudentDomainInterface

enum GradeType: Int, CaseIterable {
    case one = 1
    case two
    case three
}

enum ClassType: Int, CaseIterable {
    case one = 1
    case two
    case three
    case four
}

protocol FilterStateProtocol {
    var isError: Bool { get }
    var isLoading: Bool { get }
    var isPresentedTechStackAppend: Bool { get }
    var userRole: UserRoleType { get }
    var techStacks: [String] { get }
    var gradeSet: Set<GradeType> { get }
    var classSet: Set<ClassType> { get }
    var departmentSet: Set<DepartmentType> { get }
    var majorSet: Set<String> { get }
    var majorList: [String] { get }
    var formOfEmploymentSet: Set<FormOfEmployment> { get }
    var lowerScoreValue: Int { get }
    var upperScoreValue: Int { get }
    var lowerSalaryValue: Int { get }
    var upperSalaryValue: Int { get }
    var stuNumSortType: SortType { get }
    var scoreSortType: SortType { get }
    var salarySortType: SortType { get }
}

protocol FilterActionProtocol: AnyObject {
    func updateIsError(isError: Bool)
    func updateIsLoading(isLoading: Bool)
    func updateUserRole(role: UserRoleType)
    func updateIsPresentedTeckStackAppend(isPresented: Bool)
    func updateTeckStacks(techStacks: [String])
    func updateLowerScoreValue(lowerValue: Int)
    func updateUpperScoreValue(upperValue: Int)
    func updateLowerSalaryValue(lowerValue: Int)
    func updateUpperSalaryValue(upperValue: Int)
    func updpateMajorList(majorList: [String])
    func insertGrade(grade: GradeType)
    func removeGrade(grade: GradeType)
    func insertClass(class: ClassType)
    func removeClass(class: ClassType)
    func insertDepartment(department: DepartmentType)
    func removeDepartment(department: DepartmentType)
    func insertMajor(major: String)
    func removeMajor(major: String)
    func insertFormOfEmployment(formOfEmployment: FormOfEmployment)
    func removeFormOfEmployment(formOfEmployment: FormOfEmployment)
    func insertStuNumSortType(stuNumSortType: SortType)
    func insertScoreSortType(scoreSortType: SortType)
    func insertSalarySortType(salarySortType: SortType)
}
