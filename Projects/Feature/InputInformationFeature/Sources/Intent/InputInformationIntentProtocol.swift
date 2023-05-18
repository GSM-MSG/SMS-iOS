import Foundation
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import InputMilitaryInfoFeatureInterface
import InputCertificateInfoFeatureInterface
import InputLanguageInfoFeatureInterface

protocol InputInformationIntentProtocol:
    InputProfileDelegate,
    InputSchoolLifeDelegate,
    InputWorkDelegate,
    InputMilitaryDelegate,
    InputCertificateDelegate,
    InputLanguageDelegate {}
