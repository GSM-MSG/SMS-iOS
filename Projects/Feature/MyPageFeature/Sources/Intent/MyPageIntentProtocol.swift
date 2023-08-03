import Foundation

protocol MyPageIntentProtocol:
    MyPageProfileIntentProtocol,
    MyPageSchoolLifeIntentProtocol,
    MyPageWorkInfoIntentProtocol,
    MyPageMilitaryIntentProtocol,
    MyPageCertificateIntentProtocol,
    MyPageLanguageIntentProtocol,
    MyPageProjectIntentProtocol,
    MyPagePrizeIntentProtocol {
    func existActionSheetIsRequired()
    func existActionSheetDismissed()
    func logoutDialogIsRequired()
    func logoutDialogDismissed()
    func logoutDialogIsComplete()
    func withdrawalDialogIsRequired()
    func withdrawalDialogDismissed()
    func withdrawalDialogIsComplete()
}
