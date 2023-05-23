import Foundation
import StudentDomainInterface

protocol InputMilitaryInfoIntentProtocol {
    func militarySheetIsRequired()
    func militarySheetDismissed()
    func militaryServiceTypeDidSelected(type: MilitaryServiceType)
    func prevButtonDidTap()
    func nextButtonDidTap()
}
