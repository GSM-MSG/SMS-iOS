import Foundation

final class TechStackAppendIntent: TechStackAppendIntentProtocol {
    private let model: (any TechStackAppendActionProtocol)?

    init(model: any TechStackAppendActionProtocol) {
        self.model = model
    }

    func updateSearchText(text: String) {
        model?.updateSearchText(text: text)
        model?.updateTechStacks(stacks: [
            "Flask",
            "Figma",
            "triple",
            "trlliple",
            "tripfle",
            "tripl2e"
        ])
    }

    func selectTechStack(stack: String) {
        model?.appendTechStack(stack: stack)
    }

    func deselectTechStack(stack: String) {
        model?.removeTechStack(stack: stack)
    }

    func resetRecentTechStackButtonDidTap() {
        model?.resetRecentTechStack()
    }
}
