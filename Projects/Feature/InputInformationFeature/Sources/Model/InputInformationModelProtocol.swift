import Foundation
import InputProfileInfoFeatureInterface
import InputProjectInfoFeatureInterface
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
    case project
}

protocol InputInformationStateProtocol {
    var phase: InformationPhase { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
    var errorMessage: String { get }
    var inputProfileInformationObject: InputProfileInformationObject? { get }
    var inputSchoolLifeInformationObject: InputSchoolLifeInformationObject? { get }
    var inputWorkInfomationObject: InputWorkInformationObject? { get }
    var certificates: [String] { get }
    var militaryServiceType: MilitaryServiceType? { get }
    var languages: [InputStudentInformationRequestDTO.LanguageCertificate] { get }
    var projects: [InputProjectInfoObject] { get }
    var isCompleteToInputAllInfo: Bool { get }
}

protocol InputInformationActionProtocol: AnyObject {
    func prevButtonDidTap()
    func nextButtonDidTap()
    func updateInputProfileInformationObject(object: InputProfileInformationObject)
    func updateInputSchoolLifeInformationObject(object: InputSchoolLifeInformationObject)
    func updateInputWorkInformationObject(object: InputWorkInformationObject)
    func updateCertificates(certificates: [String])
    func updateMilitaryServiceType(type: MilitaryServiceType)
    func updateLanguages(languages: [InputStudentInformationRequestDTO.LanguageCertificate])
    func updateProjects(projects: [InputProjectInfoObject])
    func updateIsCompleteToInputAllInfo(isComplete: Bool)
    func updateIsLoading(isLoading: Bool)
    func updateIsError(isError: Bool)
    func updateErrorMessage(message: String)
}
