import Foundation
import StudentDomainInterface

protocol InputWorkInfoIntentProtocol {
    func appendWorkRegion()
    func updateWorkRegion(region: String, at index: Int)
    func deleteWorkRegion(at index: Int)
    func updateSalary(salary: String)
    func updateFormOfEmployment(form: FormOfEmployment)
    func formOfEmployeementSheetIsRequired()
    func formOfEmployeementSheetDismissed()
    func prevButtonDidTap()
    func nextButtonDidTap(state: any InputWorkInfoStateProtocol)
}
