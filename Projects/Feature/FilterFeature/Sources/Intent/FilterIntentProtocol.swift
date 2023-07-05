import Foundation
import FilterFeatureInterface
import StudentDomainInterface

protocol FilterIntentProtocol {
    func onAppear()
    func techStackAppendIsRequired()
    func techStackAppendDismissed()
    func techStackAppendDidComplete(techStacks: [String])
    func lowerScoreValue(lowValue: String, upperValue: Int)
    func upperScoreValue(lowValue: Int, upperValue: String)
    func lowerSalaryValue(lowValue: String, upperValue: Int)
    func upperSalaryValue(lowValue: Int, upperValue: String)
    func gradeSelect(grade: GradeType)
    func gardeDeSelect(grade: GradeType)
    func classSelect(class: ClassType)
    func classDeSelect(class: ClassType)
    func departmentSelect(department: DepartmentType)
    func departmentDeSelect(department: DepartmentType)
    func majorSelect(major: String)
    func majorDeSelect(major: String)
    func formOfEmploymentSeletect(formOfEmployment: FormOfEmployment)
    func formOfEmploymentDeSeletect(formOfEmployment: FormOfEmployment)
    func stuNumSortTypeSelect(stuNumSortType: SortType)
    func scoreSortTypeSelect(scoreSortType: SortType)
    func salarySortyTypeSelect(salarySortType: SortType)
    func clearFilter()
    func filterCompleteButtonDidTap(state: any FilterStateProtocol)
}
