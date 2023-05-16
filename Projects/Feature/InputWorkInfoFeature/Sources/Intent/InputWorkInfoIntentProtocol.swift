import Foundation

protocol InputWorkInfoIntentProtocol {
    func updateWorkRegion(region: String)
    func updateSalary(salary: String)
    func formOfEmployeementSheetIsRequired()
    func formOfEmployeementSheetDismissed()
}
