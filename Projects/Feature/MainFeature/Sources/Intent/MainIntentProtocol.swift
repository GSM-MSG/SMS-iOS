import Foundation
import FilterFeatureInterface
import StudentDomainInterface

protocol MainIntentProtocol: FilterDelegate {
    func reachedBottom(page: Int, isLast: Bool, filterOption: FilterOption?)
    func refresh(filterOption: FilterOption?)
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
