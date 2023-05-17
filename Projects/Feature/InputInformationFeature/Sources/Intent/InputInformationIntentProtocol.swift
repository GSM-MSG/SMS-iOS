import Foundation
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import InputMilitaryInfoFeatureInterface

protocol InputInformationIntentProtocol:
    InputProfileDelegate,
    InputSchoolLifeDelegate,
    InputWorkDelegate,
    InputMilitaryDelegate {}
