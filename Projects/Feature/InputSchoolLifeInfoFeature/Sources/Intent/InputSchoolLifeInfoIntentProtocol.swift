import Foundation

protocol InputSchoolLifeInfoIntentProtocol {
    func updateAuthenticationScore(score: String)
    func hwpFileImporterIsRequred()
    func hwpFileImporterDismissed()
    func hwpFileDidSelect(url: URL)
    func failedToImportHWPFile()
    func prevButtonDidTap()
    func nextButtonDidTap(state: any InputSchoolLifeInfoStateProtocol)
}
