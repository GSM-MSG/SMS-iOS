import Foundation
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import StudentDomainInterface

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
    var inputProfileInformationObject: InputProfileInformationObject? { get }
    var inputSchoolLifeInformationObject: InputSchoolLifeInformationObject? { get }
    var inputWorkInfomationObject: InputWorkInformationObject? { get }
    var languages: [InputStudentInformationRequestDTO.LanguageCertificate] { get }
}

protocol InputInformationActionProtocol: AnyObject {
    func prevButtonDidTap()
    func nextButtonDidTap()
    func updateInputProfileInformationObject(object: InputProfileInformationObject)
    func updateInputSchoolLifeInformationObject(object: InputSchoolLifeInformationObject)
    func updateInputWorkInformationObject(object: InputWorkInformationObject)
    func updateLanguages(languages: [InputStudentInformationRequestDTO.LanguageCertificate])
}
