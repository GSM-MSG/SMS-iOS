import Foundation

protocol InputWorkInfoStateProtocol {
    var workRegion: String { get }
    var salary: String { get }
    var isPresentedFormOfEmployeementSheet: Bool { get }
}

protocol InputWorkInfoActionProtocol: AnyObject {
    func updateWorkRegion(region: String)
    func updateSalary(salary: String)
    func updateIsPresentedFormOfEmployeementSheet(isPresented: Bool)
}
