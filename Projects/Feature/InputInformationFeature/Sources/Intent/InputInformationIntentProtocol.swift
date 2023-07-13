import Foundation
import InputCertificateInfoFeatureInterface
import InputLanguageInfoFeatureInterface
import InputMilitaryInfoFeatureInterface
import InputProfileInfoFeatureInterface
import InputProjectInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface

protocol InputInformationIntentProtocol:
    InputProfileDelegate,
    InputSchoolLifeDelegate,
    InputWorkDelegate,
    InputMilitaryDelegate,
    InputCertificateDelegate,
    InputLanguageDelegate,
    InputProjectInfoDelegate {
    func completeToInputAllInfo(state: any InputInformationStateProtocol)
    func errorAlertDismissed()
}
