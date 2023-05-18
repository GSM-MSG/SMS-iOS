import Foundation

protocol InputWorkInfoStateProtocol {
    var workRegionList: [String] { get }
    var salary: String { get }
    var isPresentedFormOfEmployeementSheet: Bool { get }
}

protocol InputWorkInfoActionProtocol: AnyObject {
    func appendWorkRegion()
    func updateWorkRegion(region: String, at index: Int)
    func deleteWorkRegion(at index: Int)
    func updateSalary(salary: String)
    func updateIsPresentedFormOfEmployeementSheet(isPresented: Bool)
}
