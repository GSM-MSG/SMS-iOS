import Foundation
import InputWorkInfoFeatureInterface
import StudentDomainInterface
import Validator
import FoundationUtil

final class InputWorkInfoIntent: InputWorkInfoIntentProtocol {
    private weak var model: (any InputWorkInfoActionProtocol)?
    private weak var inputWorkDelegate: (any InputWorkDelegate)?

    init(
        model: any InputWorkInfoActionProtocol,
        inputWorkDelegate: any InputWorkDelegate
    ) {
        self.model = model
        self.inputWorkDelegate = inputWorkDelegate
    }

    func appendWorkRegion() {
        model?.appendWorkRegion()
    }

    func updateWorkRegion(region: String, at index: Int) {
        guard region.isNotEmpty else {
            model?.updateWorkRegion(region: "", at: index)
            return
        }
        let regexValidator = RegexValidator(pattern: "^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9\\W]{0,10}$")
        guard regexValidator.validate(region) else { return }
        model?.updateWorkRegion(region: region, at: index)
    }

    func deleteWorkRegion(at index: Int) {
        model?.deleteWorkRegion(at: index)
    }

    func updateSalary(salary: String) {
        model?.updateSalary(salary: salary)
    }

    func updateFormOfEmployment(form: FormOfEmployment) {
        model?.updateFormOfEmployment(form: form)
    }

    func formOfEmployeementSheetIsRequired() {
        model?.updateIsPresentedFormOfEmployeementSheet(isPresented: true)
    }

    func formOfEmployeementSheetDismissed() {
        model?.updateIsPresentedFormOfEmployeementSheet(isPresented: false)
    }

    func prevButtonDidTap() {
        inputWorkDelegate?.workPrevButtonDidTap()
    }

    func nextButtonDidTap(state: any InputWorkInfoStateProtocol) {
        let input = InputWorkInformationObject(
            formOfEmployment: state.formOfEmployment.rawValue,
            salary: Int(state.salary) ?? 0,
            workRegion: state.workRegionList
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                .filter { $0.isNotEmpty }
        )
        inputWorkDelegate?.completeToInputWork(input: input)
    }
}
