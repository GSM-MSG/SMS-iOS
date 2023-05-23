import Foundation

protocol InputSchoolLifeInfoStateProtocol {
    var authenticationScore: String { get }
    var isPresentedHWPFileImporter: Bool { get }
    var hwpFileURL: URL? { get }
    var hwpFilename: String { get }
    var errorField: Set<InputSchoolLifeErrorField> { get }
}

protocol InputSchoolLifeInfoActionProtocol: AnyObject {
    func updateAuthenticationScore(score: String)
    func updateIsPresentedHWPFileImporter(isPresented: Bool)
    func updateHWPFileURL(url: URL)
    func updateErrorField(field: Set<InputSchoolLifeErrorField>)
}
