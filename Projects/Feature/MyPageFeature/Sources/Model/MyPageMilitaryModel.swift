import StudentDomainInterface

protocol MyPageMilitaryStateProtocol {
    var selectedMilitaryServiceType: MilitaryServiceType { get }
    var isPresentedMilitarySheet: Bool { get }
}

protocol MyPageMilitaryActionProtocol: AnyObject {
    func updateIsPresentedMilitarySheet(isPresented: Bool)
    func updateMilitaryServiceType(type: MilitaryServiceType)
}

extension MyPageModel: MyPageMilitaryActionProtocol {
    func updateIsPresentedMilitarySheet(isPresented: Bool) {
        self.isPresentedMilitarySheet = isPresented
    }

    func updateMilitaryServiceType(type: MilitaryServiceType) {
        self.selectedMilitaryServiceType = type
    }
}
