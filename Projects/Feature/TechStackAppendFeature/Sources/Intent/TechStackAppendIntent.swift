import EventLimiter
import Foundation

final class TechStackAppendIntent: TechStackAppendIntentProtocol {
    private let model: (any TechStackAppendActionProtocol)?
    private let completion: ([String]) -> Void
    private let debouncer = Debouncer(for: 0.2)

    init(
        model: any TechStackAppendActionProtocol,
        completion: @escaping ([String]) -> Void
    ) {
        self.model = model
        self.completion = completion
    }

    func updateSearchText(text: String) {
        model?.updateSearchText(text: text)
        debouncer { [weak self] in
            guard let self else { return }
            model?.updateTechStacks(stacks: [
                "Figma",
                "Triple",
                "Triplee",
                "Triple3",
                "Tripple4",
                "Tri2ple"
            ].filter { $0.contains(text) || text.isEmpty })
            #warning("techStack fetch하는 로직 추가")
        }
    }

    func selectTechStack(stack: String) {
        model?.appendTechStack(stack: stack)
    }

    func deselectTechStack(stack: String) {
        model?.removeTechStack(stack: stack)
    }

    func resetRecentTechStackButtonDidTap() {
        model?.resetRecentTechStack()
        model?.resetTechStack()
    }

    func appendButtonDidTap(techStacks: [String]) {
        completion(techStacks)
    }
}
