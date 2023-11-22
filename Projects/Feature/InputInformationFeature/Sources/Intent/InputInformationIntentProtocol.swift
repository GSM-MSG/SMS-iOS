import Foundation
import InputCertificateInfoFeatureInterface
import InputLanguageInfoFeatureInterface
import InputProfileInfoFeatureInterface
import InputProjectInfoFeatureInterface
import InputPrizeInfoFeatureInterface

protocol InputInformationIntentProtocol:
    InputProfileDelegate,
    InputCertificateDelegate,
    InputLanguageDelegate,
    InputProjectInfoDelegate,
    InputPrizeDelegate {
    func completeToInputAllInfo(state: any InputInformationStateProtocol)
    func errorAlertDismissed()
}
