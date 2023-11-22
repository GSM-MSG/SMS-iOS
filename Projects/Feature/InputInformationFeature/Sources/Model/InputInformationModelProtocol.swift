import Foundation
import InputProfileInfoFeatureInterface
import InputProjectInfoFeatureInterface
import InputPrizeInfoFeatureInterface
import StudentDomainInterface

enum InformationPhase: CaseIterable {
    case profile
    case certificate
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
    var projects: [InputProjectInfoObject] { get }
    var prizes: [InputPrizeInfoObject] { get }
    var isCompleteToInputAllInfo: Bool { get }
}

protocol InputInformationActionProtocol: AnyObject {
    func prevButtonDidTap()
    func nextButtonDidTap()
    func updateInputProfileInformationObject(object: InputProfileInformationObject)
    func updateProjects(projects: [InputProjectInfoObject])
    func updatePrizes(prizes: [InputPrizeInfoObject])
    func updateIsCompleteToInputAllInfo(isComplete: Bool)
    func updateIsLoading(isLoading: Bool)
    func updateIsError(isError: Bool)
    func updateErrorMessage(message: String)
}
