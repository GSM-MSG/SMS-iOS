protocol MyPageStateProtocol:
    MyPageProfileStateProtocol,
    MyPageSchoolLifeStateProtocol,
    MyPageWorkInfoStateProtocol,
    MyPageMilitaryStateProtocol,
    MyPageCertificateStateProtocol,
    MyPageLanguageInfoStateProtocol,
    MyPageProjectStateProtocol {}

protocol MyPageActionProtocol:
    AnyObject,
    MyPageProfileActionProtocol,
    MyPageSchoolLifeActionProtocol,
    MyPageWorkInfoActionProtocol,
    MyPageMilitaryActionProtocol,
    MyPageCertificateActionProtocol,
    MyPageLanguageInfoActionProtocol,
    MyPageProjectActionProtocol {}
