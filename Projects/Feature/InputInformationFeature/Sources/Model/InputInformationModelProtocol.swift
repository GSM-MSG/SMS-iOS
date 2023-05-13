import Foundation

enum InformationPhase: CaseIterable {
    case profile
    case school
    case workCondition
    case military
    case certification
    case language
}

protocol InputInformationStateProtocol {
    var phase: InformationPhase { get }
}

protocol InputInformationActionProtocol: AnyObject {
    func prevButtonDidTap()
    func nextButtonDidTap()
}