import Foundation
import InputSchoolLifeInfoFeatureInterface

enum InformationPhase: CaseIterable {
    case profile
    case school
    case workCondition
    case military
    case certificate
    case language
}

protocol InputInformationStateProtocol {
    var phase: InformationPhase { get }
    var inputSchoolLifeInformationObject: InputSchoolLifeInformationObject? { get }
}

protocol InputInformationActionProtocol: AnyObject {
    func prevButtonDidTap()
    func nextButtonDidTap()
    func updateInputSchoolLifeInformationObject(object: InputSchoolLifeInformationObject)
}
