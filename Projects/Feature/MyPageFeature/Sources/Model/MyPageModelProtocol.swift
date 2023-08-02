protocol MyPageStateProtocol:
    MyPageProfileStateProtocol,
    MyPageSchoolLifeStateProtocol,
    MyPageWorkInfoStateProtocol,
    MyPageMilitaryStateProtocol,
    MyPageCertificateStateProtocol {}

protocol MyPageActionProtocol:
    AnyObject,
    MyPageProfileActionProtocol,
    MyPageSchoolLifeActionProtocol,
    MyPageWorkInfoActionProtocol,
    MyPageMilitaryActionProtocol,
    MyPageCertificateActionProtocol {}
