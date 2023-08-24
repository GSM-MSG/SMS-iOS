import Foundation

protocol InputSchoolLifeInfoStateProtocol {
    var authenticationScore: String { get }
    var errorField: Set<InputSchoolLifeErrorField> { get }
    var isDisabledNextButton: Bool { get }
}

protocol InputSchoolLifeInfoActionProtocol: AnyObject {
    func updateAuthenticationScore(score: String)
    func updateErrorField(field: Set<InputSchoolLifeErrorField>)
}
