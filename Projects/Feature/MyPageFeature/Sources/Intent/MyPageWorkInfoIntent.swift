import StudentDomainInterface
import Validator

protocol MyPageWorkInfoIntentProtocol {
    func appendWorkRegion()
    func updateWorkRegion(region: String, at index: Int)
    func deleteWorkRegion(at index: Int)
    func updateSalary(salary: String)
    func updateFormOfEmployment(form: FormOfEmployment)
    func formOfEmployeementSheetIsRequired()
    func formOfEmployeementSheetDismissed()
}

extension MyPageIntent: MyPageWorkInfoIntentProtocol {
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
}
