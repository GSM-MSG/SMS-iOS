import Foundation
import InputMilitaryInfoFeatureInterface
import StudentDomainInterface

final class InputMilitaryInfoIntent: InputMilitaryInfoIntentProtocol {
    private weak var model: (any InputMilitaryInfoActionProtocol)?
    private weak var militaryDelegate: (any InputMilitaryDelegate)?

    init(
        model: any InputMilitaryInfoActionProtocol,
        militaryDelegate: any InputMilitaryDelegate
    ) {
        self.model = model
        self.militaryDelegate = militaryDelegate
    }

    func prevButtonDidTap() {
        militaryDelegate?.militaryPrevButtonDidTap()
    }

    func nextButtonDidTap() {
        militaryDelegate?.completeToInputMilitary()
    }

    func militarySheetIsRequired() {
        model?.updateIsPresentedMilitarySheet(isPresented: true)
    }

    func militarySheetDismissed() {
        model?.updateIsPresentedMilitarySheet(isPresented: false)
    }

    func militaryServiceTypeDidSelected(type: MilitaryServiceType) {
        model?.updateMilitaryServiceType(type: type)
    }
}
