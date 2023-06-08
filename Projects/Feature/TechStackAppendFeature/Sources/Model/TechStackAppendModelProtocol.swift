import Foundation

protocol TechStackAppendStateProtocol {
    var searchText: String { get }
    var techStacks: [String] { get }
    var selectedTechStacks: Set<String> { get }
    var recentTechStacks: [String] { get }
}

protocol TechStackAppendActionProtocol: AnyObject {
    func updateSearchText(text: String)
    func updateTechStacks(stacks: [String])
    func appendTechStack(stack: String)
    func removeTechStack(stack: String)
    func resetTechStack()
    func resetRecentTechStack()
}
