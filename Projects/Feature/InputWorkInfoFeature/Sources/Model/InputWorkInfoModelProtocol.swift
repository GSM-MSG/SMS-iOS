import Foundation

protocol InputWorkInfoStateProtocol {
    var workRegion: String { get }
    var salary: String { get }
}

protocol InputWorkInfoActionProtocol: AnyObject {
    func updateWorkRegion(region: String)
    func updateSalary(salary: String)
}
