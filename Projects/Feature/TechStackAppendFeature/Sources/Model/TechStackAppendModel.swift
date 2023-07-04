import Combine
import Foundation

final class TechStackAppendModel: ObservableObject, TechStackAppendStateProtocol {
    @Published var searchText: String = ""
    @Published var techStacks: [String] = []
    @Published var selectedTechStacks: Set<String> = []
    @Published var recentTechStacks: [String] = []
    @Published var isPresentedToast: Bool = false
    @Published var toastMessage: String = ""
    @Published var toastStyle: TechStackToastStyle = .appended

    init(initialTechStack: [String]) {
        self.selectedTechStacks = Set(initialTechStack)
        self.recentTechStacks = initialTechStack
    }
}

extension TechStackAppendModel: TechStackAppendActionProtocol {
    func updateSearchText(text: String) {
        self.searchText = text
    }

    func updateTechStacks(stacks: [String]) {
        self.techStacks = stacks
    }

    func appendDirectTechStacks(stack: String) {
        techStacks.append(stack)
        selectedTechStacks.insert(stack)
        recentTechStacks.append(stack)
    }

    func appendTechStack(stack: String) {
        selectedTechStacks.insert(stack)
        recentTechStacks.append(stack)
    }

    func removeTechStack(stack: String) {
        selectedTechStacks.remove(stack)
        recentTechStacks.removeAll { $0 == stack }
    }

    func resetTechStack() {
        selectedTechStacks.removeAll()
    }

    func resetRecentTechStack() {
        recentTechStacks.removeAll()
    }

    func updateIsPresentedToast(isPresented: Bool) {
        isPresentedToast = isPresented
    }

    func updateToastMessage(message: String) {
        toastMessage = message
    }

    func updateToastStyle(style: TechStackToastStyle) {
        toastStyle = style
    }
}
