import Foundation

protocol InputMilitaryInfoStateProtocol {
    var isPresentedMilitarySheet: Bool { get }
}

protocol InputMilitaryInfoActionProtocol: AnyObject {
    func updateIsPresentedMilitarySheet(isPresented: Bool)
}
