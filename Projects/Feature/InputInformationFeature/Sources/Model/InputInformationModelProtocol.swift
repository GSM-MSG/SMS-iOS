import Foundation
import InputProfileInfoFeatureInterface
import InputProjectInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import InputPrizeInfoFeatureInterface
import StudentDomainInterface

enum InformationPhase: CaseIterable {
    case profile
    case school
    case workCondition
    case military
    case certificate
    case language
    case project
    case prize
}

protocol InputInformationStateProtocol {
    var phase: InformationPhase { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
    var errorMessage: String { get }
    var inputProfileInformationObject: InputProfileInformationObject? { get }
    var gsmAuthenticationScore: Int { get }
    var inputWorkInfomationObject: InputWorkInformationObject? { get }
    var certificates: [String] { get }
    var militaryServiceType: MilitaryServiceType? { get }
    var languages: [InputStudentInformationRequestDTO.LanguageCertificate] { get }
    var projects: [InputProjectInfoObject] { get }
    var prizes: [InputPrizeInfoObject] { get }
    var isCompleteToInputAllInfo: Bool { get }
}

protocol InputInformationActionProtocol: AnyObject {
    func prevButtonDidTap()
    func nextButtonDidTap()
    func updateInputProfileInformationObject(object: InputProfileInformationObject)
    func updateInputSchoolLifeInformationObject(gsmAuthenticationScore: Int)
    func updateInputWorkInformationObject(object: InputWorkInformationObject)
    func updateCertificates(certificates: [String])
    func updateMilitaryServiceType(type: MilitaryServiceType)
    func updateLanguages(languages: [InputStudentInformationRequestDTO.LanguageCertificate])
    func updateProjects(projects: [InputProjectInfoObject])
    func updatePrizes(prizes: [InputPrizeInfoObject])
    func updateIsCompleteToInputAllInfo(isComplete: Bool)
    func updateIsLoading(isLoading: Bool)
    func updateIsError(isError: Bool)
    func updateErrorMessage(message: String)
}
