import Foundation

protocol TechStackAppendIntentProtocol {
    func updateSearchText(text: String)
    func selectTechStack(stack: String)
    func deselectTechStack(stack: String)
    func resetRecentTechStackButtonDidTap()
    func appendButtonDidTap(techStacks: [String])
}
