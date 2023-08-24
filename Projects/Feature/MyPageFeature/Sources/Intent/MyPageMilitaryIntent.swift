import StudentDomainInterface

protocol MyPageMilitaryIntentProtocol {
    func militarySheetIsRequired()
    func militarySheetDismissed()
    func militaryServiceTypeDidSelected(type: MilitaryServiceType)
}

extension MyPageIntent: MyPageMilitaryIntentProtocol {
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
