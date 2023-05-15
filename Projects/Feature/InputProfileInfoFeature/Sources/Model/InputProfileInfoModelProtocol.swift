import Foundation

protocol InputProfileInfoStateProtocol {
    var introduce: String { get }
    var email: String { get }
    var major: String { get }
    var portfoiloURL: String { get }
    var techStack: String { get }
    var isPresentedMajorSheet: Bool { get }
}

protocol InputProfileInfoActionProtocol: AnyObject {
    func updateIntroduce(introduce: String)
    func updateEmail(email: String)
    func updateMajor(major: String)
    func updatePortfoiloURL(portfoiloURL: String)
    func updateTeckStack(techStack: String)
    func updateIsPresentedMajorSheet(isPresented: Bool)
}
