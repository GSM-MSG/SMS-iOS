import Foundation

enum TechStackToastStyle {
    case appended
    case removed
}

protocol TechStackAppendStateProtocol {
    var searchText: String { get }
    var techStacks: [String] { get }
    var selectedTechStacks: Set<String> { get }
    var recentTechStacks: [String] { get }
    var isPresentedToast: Bool { get }
    var toastMessage: String { get }
    var toastStyle: TechStackToastStyle { get }
}

protocol TechStackAppendActionProtocol: AnyObject {
    func updateSearchText(text: String)
    func updateTechStacks(stacks: [String])
    func appendDirectTechStacks(stack: String)
    func appendTechStack(stack: String)
    func removeTechStack(stack: String)
    func resetTechStack()
    func resetRecentTechStack()
    func updateIsPresentedToast(isPresented: Bool)
    func updateToastMessage(message: String)
    func updateToastStyle(style: TechStackToastStyle)
}
