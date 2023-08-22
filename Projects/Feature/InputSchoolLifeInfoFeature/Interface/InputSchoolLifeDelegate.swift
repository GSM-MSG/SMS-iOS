import Foundation

public protocol InputSchoolLifeDelegate: AnyObject {
    func schoolLifePrevButtonDidTap()
    func completeToInputSchoolLife(gsmAuthenticationScore: Int)
}
