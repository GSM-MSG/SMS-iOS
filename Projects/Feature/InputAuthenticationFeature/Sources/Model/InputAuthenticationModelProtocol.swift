import Foundation

struct AuthenticationInfo: Equatable {
    var title: String
    var content: String
}

protocol InputAuthenticationStateProtocol {
    var authenticationTitle: String { get }
    var authenticationContent: String { get }
    var authenticationList: [AuthenticationInfo] { get }
    var collapsedAuthentication: [Bool] { get }
}

protocol InputAuthenticationActionProtocol: AnyObject {
    func updateAuthenticationTitle(index: Int, title: String)
    func updateAuthenticationContent(index: Int, content: String)
    func appendEmptyAuthentication()
}
