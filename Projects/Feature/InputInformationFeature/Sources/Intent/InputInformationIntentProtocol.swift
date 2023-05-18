import Foundation
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import InputMilitaryInfoFeatureInterface
import InputCertificateInfoFeatureInterface

protocol InputInformationIntentProtocol:
    InputProfileDelegate,
    InputSchoolLifeDelegate,
    InputWorkDelegate,
    InputMilitaryDelegate,
    InputCertificateDelegate {}
