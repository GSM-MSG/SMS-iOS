import Foundation
import FilterFeatureInterface
import MyPageFeatureInterface
import StudentDomainInterface
import GSMAuthenticationFormFeatureInterface

protocol MainIntentProtocol: FilterDelegate, MyPageDelegate, GSMAuthenticationDelegate {
    func reachedBottom(page: Int, isLast: Bool, filterOption: FilterOption?)
    func refresh(filterOption: FilterOption?)
    func filterIsRequired()
    func filterDismissed()
    func myPageIsRequired()
    func myPageDismissed()
    func studentDidSelect(userID: String)
    func studentDetailDismissed()
    func exitIsRequired()
    func exitIsDismissed()
}
