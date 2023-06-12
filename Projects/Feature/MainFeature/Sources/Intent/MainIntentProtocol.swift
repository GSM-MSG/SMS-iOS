import Foundation
import StudentDomainInterface

protocol MainIntentProtocol {
    func reachedBottom(page: Int, isLast: Bool)
    func existActionSheetIsRequired()
    func existActionSheetDismissed()
    func logoutDialogIsRequired()
    func logoutDialogDismissed()
    func logoutDialogIsComplete()
    func withdrawalDialogIsRequired()
    func withdrawalDialogDismissed()
    func withdrawalDialogIsComplete()
    func studentDidSelect(userID: String)
    func studentDetailDismissed()
}
