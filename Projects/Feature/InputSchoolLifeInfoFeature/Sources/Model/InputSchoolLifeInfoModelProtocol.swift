import Foundation

protocol InputSchoolLifeInfoStateProtocol {
    var authenticationScroe: String { get }
    var isPresentedHWPFileImporter: Bool { get }
}

protocol InputSchoolLifeInfoActionProtocol: AnyObject {
    func updateAuthenticationScore(score: String)
    func updateIsPresentedHWPFileImporter(isPresented: Bool)
}
