import Foundation

protocol InputWorkInfoIntentProtocol {
    func updateWorkRegion(region: String, at index: Int)
    func updateSalary(salary: String)
    func formOfEmployeementSheetIsRequired()
    func formOfEmployeementSheetDismissed()
    func prevButtonDidTap()
    func nextButtonDidTap()
}
