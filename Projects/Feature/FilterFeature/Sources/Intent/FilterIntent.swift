import Combine
import FilterFeatureInterface
import MajorDomainInterface
import StudentDomainInterface
import SwiftUI
import UserDomainInterface

final class FilterIntent: FilterIntentProtocol {
    private weak var model: (any FilterActionProtocol)?
    private weak var filterDelegate: (any FilterDelegate)?
    private let fetchMajorListUseCase: any FetchMajorListUseCase
    private let loadUserRoleUseCase: any LoadUserRoleUseCase

    init(
        model: any FilterActionProtocol,
        filterDelegate: any FilterDelegate,
        fetchMajorListUseCase: any FetchMajorListUseCase,
        loadUserRoleUseCase: any LoadUserRoleUseCase
    ) {
        self.filterDelegate = filterDelegate
        self.model = model
        self.fetchMajorListUseCase = fetchMajorListUseCase
        self.loadUserRoleUseCase = loadUserRoleUseCase
    }

    func onAppear() {
        let userRole = loadUserRoleUseCase.execute()
        model?.updateUserRole(role: userRole)
        Task {
            let majorList = try await fetchMajorListUseCase.execute()
            model?.updpateMajorList(majorList: majorList)
        }
    }

    func lowerScoreValue(lowValue: String, upperValue: Int) {
        if Int(lowValue) ?? 0 > upperValue {
            model?.updateLowerScoreValue(lowerValue: upperValue)
        } else {
            model?.updateLowerScoreValue(lowerValue: Int(lowValue) ?? 0)
        }
    }

    func upperScoreValue(lowValue: Int, upperValue: String) {
        if Int(upperValue) ?? 0 > 2000 {
            model?.updateUpperScoreValue(upperValue: 2000)
        } else if Int(upperValue) ?? 0 < lowValue {
                model?.updateUpperScoreValue(upperValue: lowValue)
        } else {
            model?.updateUpperScoreValue(upperValue: Int(upperValue) ?? 0)
        }
    }

    func lowerSalaryValue(lowValue: String, upperValue: Int) {
        let low = removeCurrency(lowValue)

        if low > upperValue {
            model?.updateLowerSalaryValue(lowerValue: upperValue)
        } else {
            model?.updateLowerSalaryValue(lowerValue: low)
        }
    }

    func upperSalaryValue(lowValue: Int, upperValue: String) {
        let upp = removeCurrency(upperValue)

        if upp > 9999 {
            model?.updateUpperSalaryValue(upperValue: 9999)
        } else if upp < lowValue {
            model?.updateUpperSalaryValue(upperValue: lowValue)
        } else {
            model?.updateUpperSalaryValue(upperValue: upp)
        }
    }

    func techStackAppendIsRequired() {
        model?.updateIsPresentedTeckStackAppend(isPresented: true)
    }

    func techStackAppendDismissed() {
        model?.updateIsPresentedTeckStackAppend(isPresented: false)
    }

    func techStackAppendDidComplete(techStacks: [String]) {
        model?.updateTeckStacks(techStacks: techStacks)
    }

    func gradeSelect(grade: GradeType) {
        model?.insertGrade(grade: grade)
    }

    func gardeDeSelect(grade: GradeType) {
        model?.removeGrade(grade: grade)
    }

    func classSelect(class: ClassType) {
        model?.insertClass(class: `class`)
    }

    func classDeSelect(class: ClassType) {
        model?.removeClass(class: `class`)
    }

    func departmentSelect(department: DepartmentType) {
        model?.insertDepartment(department: department)
    }

    func departmentDeSelect(department: DepartmentType) {
        model?.removeDepartment(department: department)
    }

    func majorSelect(major: String) {
        model?.insertMajor(major: major)
    }

    func majorDeSelect(major: String) {
        model?.removeMajor(major: major)
    }

    func formOfEmploymentSeletect(formOfEmployment: FormOfEmployment) {
        model?.insertFormOfEmployment(formOfEmployment: formOfEmployment)
    }

    func formOfEmploymentDeSeletect(formOfEmployment: FormOfEmployment) {
        model?.removeFormOfEmployment(formOfEmployment: formOfEmployment)
    }

    func stuNumSortTypeSelect(stuNumSortType: SortType) {
        model?.insertStuNumSortType(stuNumSortType: stuNumSortType)
    }

    func scoreSortTypeSelect(scoreSortType: SortType) {
        model?.insertScoreSortType(scoreSortType: scoreSortType)
    }

    func salarySortyTypeSelect(salarySortType: SortType) {
        model?.insertSalarySortType(salarySortType: salarySortType)
    }

    func clearFilter() {
        model?.resetState()
    }

    func filterCompleteButtonDidTap(state: any FilterStateProtocol) {
        let filterOption: FilterOptionDTO =
            .init(
                majors: Array(state.majorSet),
                techStacks: state.techStacks,
                grade: state.gradeSet.map(\.rawValue),
                classNum: state.classSet.map(\.rawValue),
                department: state.departmentSet.map(\.rawValue),
                stuNumSort: state.stuNumSortType,
                formOfEmployment: state.formOfEmploymentSet.map(\.rawValue),
                minGsmAuthenticationScore: state.lowerScoreValue,
                maxGsmAuthenticationScore: state.upperScoreValue,
                gsmAuthenticationScoreSort: state.scoreSortType,
                minSalary: state.lowerSalaryValue,
                maxSalary: state.upperSalaryValue,
                salarySort: state.salarySortType
            )
        filterDelegate?.filterDidCompleted(
            filterOption: filterOption
        )
    }
}

private extension FilterIntent {
    func removeCurrency(_ input: String) -> Int {
        let output: String

        if input.contains("만원") {
            output = input.replacingOccurrences(of: "만원", with: "")
        } else if input.contains("만") {
            var replacing = input.replacingOccurrences(of: "만", with: "")
            replacing.removeLast()
            output = replacing
        } else {
            output = input
        }

        return Int(output) ?? 0
    }
}
