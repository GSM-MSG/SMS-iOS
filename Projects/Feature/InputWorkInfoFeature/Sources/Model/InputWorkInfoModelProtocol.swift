import Foundation
import StudentDomainInterface

protocol InputWorkInfoStateProtocol {
    var workRegionList: [String] { get }
    var salary: String { get }
    var salaryDisplay: String { get }
    var formOfEmployment: FormOfEmployment { get }
    var isPresentedFormOfEmployeementSheet: Bool { get }
}

protocol InputWorkInfoActionProtocol: AnyObject {
    func appendWorkRegion()
    func updateWorkRegion(region: String, at index: Int)
    func deleteWorkRegion(at index: Int)
    func updateSalary(salary: String)
    func updateFormOfEmployment(form: FormOfEmployment)
    func updateIsPresentedFormOfEmployeementSheet(isPresented: Bool)
}
