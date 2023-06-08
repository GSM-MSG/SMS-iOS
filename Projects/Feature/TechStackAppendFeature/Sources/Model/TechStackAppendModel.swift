import Combine
import Foundation

final class TechStackAppendModel: ObservableObject, TechStackAppendStateProtocol {
    @Published var searchText: String = ""
    @Published var techStacks: [String] = []
    @Published var selectedTechStacks: Set<String> = []
    @Published var recentTechStacks: [String] = []
}

extension TechStackAppendModel: TechStackAppendActionProtocol {
    func updateSearchText(text: String) {
        self.searchText = text
    }

    func updateTechStacks(stacks: [String]) {
        self.techStacks = stacks
    }

    func appendTechStack(stack: String) {
        selectedTechStacks.insert(stack)
        recentTechStacks.append(stack)
    }

    func removeTechStack(stack: String) {
        selectedTechStacks.remove(stack)
    }

    func resetRecentTechStack() {
        recentTechStacks.removeAll()
    }
}
