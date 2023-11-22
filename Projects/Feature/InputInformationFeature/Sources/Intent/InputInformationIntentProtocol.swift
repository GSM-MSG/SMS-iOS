import Foundation
import InputProfileInfoFeatureInterface
import InputPrizeInfoFeatureInterface

protocol InputInformationIntentProtocol:
    InputProfileDelegate,
    InputPrizeDelegate {
    func completeToInputAllInfo(state: any InputInformationStateProtocol)
    func errorAlertDismissed()
}
