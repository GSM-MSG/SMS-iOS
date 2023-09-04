import Foundation

protocol MyPageIntentProtocol:
    MyPageProfileIntentProtocol,
    MyPageSchoolLifeIntentProtocol,
    MyPageWorkInfoIntentProtocol,
    MyPageMilitaryIntentProtocol,
    MyPageCertificateIntentProtocol,
    MyPageLanguageInfoIntentProtocol,
    MyPageProjectIntentProtocol,
    MyPagePrizeIntentProtocol {
    func onAppear()
    func exitActionSheetIsRequired()
    func exitActionSheetDismissed()
    func logoutDialogIsRequired()
    func logoutDialogDismissed()
    func logoutDialogIsComplete()
    func withdrawalDialogIsRequired()
    func withdrawalDialogDismissed()
    func withdrawalDialogIsComplete()
    func modifyToInputAllInfo(state: MyPageStateProtocol)
    func modifyCompleteToastDismissed()
}
