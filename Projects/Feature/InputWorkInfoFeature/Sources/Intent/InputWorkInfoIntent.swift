import Foundation
import InputWorkInfoFeatureInterface
import StudentDomainInterface

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
        
        inputWorkDelegate?.completeToInputWork()
    }
}
