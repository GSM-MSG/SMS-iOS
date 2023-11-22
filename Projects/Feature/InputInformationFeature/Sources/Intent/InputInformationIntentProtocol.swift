import Foundation
import InputCertificateInfoFeatureInterface
import InputLanguageInfoFeatureInterface
import InputMilitaryInfoFeatureInterface
import InputProfileInfoFeatureInterface
import InputProjectInfoFeatureInterface
import InputPrizeInfoFeatureInterface

protocol InputInformationIntentProtocol:
    InputProfileDelegate,
    InputWorkDelegate,
    InputMilitaryDelegate,
    InputCertificateDelegate,
    InputLanguageDelegate,
    InputProjectInfoDelegate,
    InputPrizeDelegate {
    func completeToInputAllInfo(state: any InputInformationStateProtocol)
    func errorAlertDismissed()
}
