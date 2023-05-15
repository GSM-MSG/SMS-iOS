import Foundation

protocol InputProfileInfoStateProtocol {
    var introduce: String { get }
    var email: String { get }
    var major: String { get }
    var portfoiloURL: String { get }
    var techStack: String { get }
}

protocol InputProfileInfoActionProtocol: AnyObject {}
