import Foundation

final class InputMilitaryInfoModel: ObservableObject, InputMilitaryInfoStateProtocol {
    @Published var isPresentedMilitarySheet: Bool = false
}

extension InputMilitaryInfoModel: InputMilitaryInfoActionProtocol {
    func updateIsPresentedMilitarySheet(isPresented: Bool) {
        self.isPresentedMilitarySheet = isPresented
    }
}
