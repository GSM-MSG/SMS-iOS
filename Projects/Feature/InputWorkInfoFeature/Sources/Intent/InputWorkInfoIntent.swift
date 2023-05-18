import Foundation
import InputWorkInfoFeatureInterface

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

    func updateWorkRegion(region: String) {
        model?.updateWorkRegion(region: region)
    }

    func updateSalary(salary: String) {
        model?.updateSalary(salary: salary)
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

    func nextButtonDidTap() {
        inputWorkDelegate?.completeToInputWork()
    }
}
