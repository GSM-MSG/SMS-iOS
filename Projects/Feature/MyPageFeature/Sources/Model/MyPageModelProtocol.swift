protocol MyPageStateProtocol:
    MyPageProfileStateProtocol,
    MyPageSchoolLifeStateProtocol,
    MyPageWorkInfoStateProtocol,
    MyPageMilitaryStateProtocol,
    MyPageCertificateStateProtocol,
    MyPageLanguageInfoStateProtocol,
    MyPageProjectStateProtocol,
    MyPagePrizeStateProtocol {
    var isError: Bool { get }
    var isLoading: Bool { get }
    var isPresentedExitBottomSheet: Bool { get }
    var isPresentedLogoutDialog: Bool { get }
    var isPresentedWithdrawalDialog: Bool { get }
}

protocol MyPageActionProtocol:
    AnyObject,
    MyPageProfileActionProtocol,
    MyPageSchoolLifeActionProtocol,
    MyPageWorkInfoActionProtocol,
    MyPageMilitaryActionProtocol,
    MyPageCertificateActionProtocol,
    MyPageLanguageInfoActionProtocol,
    MyPageProjectActionProtocol,
    MyPagePrizeActionProtocol {
    func updateIsError(isError: Bool)
    func updateIsLoading(isLoading: Bool)
    func updateIsPresentedExitBottomSheet(isPresented: Bool)
    func updateIsPresentedLogoutDialog(isPresented: Bool)
    func updateIsPresentedWithdrawalDialog(isPresented: Bool)
}
