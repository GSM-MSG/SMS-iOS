import Foundation
import StudentDomainInterface

protocol MainIntentProtocol {
    func reachedBottom(page: Int, isLast: Bool)
    func studentDidSelect(userID: String)
    func studentDetailDismissed()
}
