import Combine
import SwiftUI
import FilterFeatureInterface
import StudentDomainInterface
import MajorDomainInterface

final class FilterIntent: FilterIntentProtocol {
    private weak var model: (any FilterActionProtocol)?
    private weak var filterDelegate: (any FilterDelegate)?
    private let fetchMajorListUseCase: any FetchMajorListUseCase

    init(
        model: any FilterActionProtocol,
        filterDelegate: any FilterDelegate,
        fetchMajorListUseCase: any FetchMajorListUseCase
    ) {
        self.filterDelegate = filterDelegate
        self.model = model
        self.fetchMajorListUseCase = fetchMajorListUseCase
    }

    func onAppear() {
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
        } else {
            if Int(upperValue) ?? 0 < lowValue {
                model?.updateUpperScoreValue(upperValue: lowValue)
            } else {
                model?.updateUpperScoreValue(upperValue: Int(upperValue) ?? 0)
            }
        }
    }

    func lowerSalaryValue(lowValue: String, upperValue: Int) {
        let low: String
        if lowValue.contains("만원") {
            low = lowValue.replacingOccurrences(of: "만원", with: "")
        } else if lowValue.contains("만") {
            var replacing = lowValue.replacingOccurrences(of: "만", with: "")
            replacing.removeLast()
            low = replacing
        } else {
            low = lowValue
        }
        if Int(low) ?? 0 > upperValue {
            model?.updateLowerSalaryValue(lowerValue: upperValue)
        } else {
            model?.updateLowerSalaryValue(lowerValue: Int(low) ?? 0)
        }
    }

    func upperSalaryValue(lowValue: Int, upperValue: String) {
        let upp: String
        if upperValue.contains("만원") {
            upp = upperValue.replacingOccurrences(of: "만원", with: "")
        } else if upperValue.contains("만") {
            var replacing = upperValue.replacingOccurrences(of: "만", with: "")
            replacing.removeLast()
            upp = replacing
        } else {
            upp = upperValue
        }

        if Int(upp) ?? 0 > 9999 {
            model?.updateUpperSalaryValue(upperValue: 9999)
        } else {
            if Int(upp) ?? 0 < lowValue {
                model?.updateUpperSalaryValue(upperValue: lowValue)
            } else {
                model?.updateUpperSalaryValue(upperValue: Int(upp) ?? 0)
            }
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
}
