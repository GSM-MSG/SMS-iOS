import Foundation
import InputProfileInfoFeatureInterface

protocol InputInformationIntentProtocol:
    InputProfileDelegate
{
    func completeToInputAllInfo(state: any InputInformationStateProtocol)
    func errorAlertDismissed()
}
