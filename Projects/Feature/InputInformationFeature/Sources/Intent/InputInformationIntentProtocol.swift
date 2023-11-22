import Foundation
import InputCertificateInfoFeatureInterface
import InputProfileInfoFeatureInterface
import InputProjectInfoFeatureInterface
import InputPrizeInfoFeatureInterface

protocol InputInformationIntentProtocol:
    InputProfileDelegate,
    InputCertificateDelegate,
    InputProjectInfoDelegate,
    InputPrizeDelegate {
    func completeToInputAllInfo(state: any InputInformationStateProtocol)
    func errorAlertDismissed()
}
