import Foundation
import InputProfileInfoFeatureInterface
import StudentDomainInterface

enum InformationPhase: CaseIterable {
    case profile
}

protocol InputInformationStateProtocol {
    var phase: InformationPhase { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
    var errorMessage: String { get }
    var inputProfileInformationObject: InputProfileInformationObject? { get }
    var isCompleteToInputAllInfo: Bool { get }
}

protocol InputInformationActionProtocol: AnyObject {
    func prevButtonDidTap()
    func nextButtonDidTap()
    func updateInputProfileInformationObject(object: InputProfileInformationObject)
    func updateIsCompleteToInputAllInfo(isComplete: Bool)
    func updateIsLoading(isLoading: Bool)
    func updateIsError(isError: Bool)
    func updateErrorMessage(message: String)
}
