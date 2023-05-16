import Foundation

protocol InputSchoolLifeInfoIntentProtocol {
    func updateAuthenticationScore(score: String)
    func hwpFilImporterIsRequred()
    func hwpFilImporterDismissed()
    func prevButtonDidTap()
    func nextButtonDidTap()
}
