import Foundation
import StudentDomainInterface

final class InputMilitaryInfoModel: ObservableObject, InputMilitaryInfoStateProtocol {
    @Published var selectedMilitaryServiceType: MilitaryServiceType = .hope
    @Published var isPresentedMilitarySheet: Bool = false
}

extension InputMilitaryInfoModel: InputMilitaryInfoActionProtocol {
    func updateIsPresentedMilitarySheet(isPresented: Bool) {
        self.isPresentedMilitarySheet = isPresented
    }

    func updateMilitaryServiceType(type: MilitaryServiceType) {
        self.selectedMilitaryServiceType = type
    }
}
