import Foundation
import StudentDomainInterface

protocol InputMilitaryInfoStateProtocol {
    var selectedMilitaryServiceType: MilitaryServiceType { get }
    var isPresentedMilitarySheet: Bool { get }
}

protocol InputMilitaryInfoActionProtocol: AnyObject {
    func updateIsPresentedMilitarySheet(isPresented: Bool)
    func updateMilitaryServiceType(type: MilitaryServiceType)
}
