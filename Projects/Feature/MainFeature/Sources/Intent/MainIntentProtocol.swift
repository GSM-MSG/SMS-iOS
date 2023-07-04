import Foundation
import StudentDomainInterface
import FilterFeatureInterface

protocol MainIntentProtocol: FilterDelegate {
    func reachedBottom(page: Int, isLast: Bool)
    func refresh()
    func existActionSheetIsRequired()
    func existActionSheetDismissed()
    func filterIsRequired()
    func filterDismissed()
    func logoutDialogIsRequired()
    func logoutDialogDismissed()
    func logoutDialogIsComplete()
    func withdrawalDialogIsRequired()
    func withdrawalDialogDismissed()
    func withdrawalDialogIsComplete()
    func studentDidSelect(userID: String)
    func studentDetailDismissed()
}
