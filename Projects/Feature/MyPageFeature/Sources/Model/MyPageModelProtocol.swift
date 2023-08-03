protocol MyPageStateProtocol:
    MyPageProfileStateProtocol,
    MyPageSchoolLifeStateProtocol,
    MyPageWorkInfoStateProtocol,
    MyPageMilitaryStateProtocol,
    MyPageCertificateStateProtocol,
    MyPageLanguageInfoStateProtocol,
    MyPageProjectStateProtocol,
    MyPagePrizeStateProtocol {}

protocol MyPageActionProtocol:
    AnyObject,
    MyPageProfileActionProtocol,
    MyPageSchoolLifeActionProtocol,
    MyPageWorkInfoActionProtocol,
    MyPageMilitaryActionProtocol,
    MyPageCertificateActionProtocol,
    MyPageLanguageInfoActionProtocol,
    MyPageProjectActionProtocol,
    MyPagePrizeActionProtocol {}
