import Foundation

protocol InputSchoolLifeInfoIntentProtocol {
    func updateAuthenticationScore(score: String)
    func prevButtonDidTap()
    func nextButtonDidTap(state: any InputSchoolLifeInfoStateProtocol)
}
