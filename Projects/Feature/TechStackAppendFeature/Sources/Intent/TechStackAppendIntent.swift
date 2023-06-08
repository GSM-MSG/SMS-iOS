import EventLimiter
import Foundation

final class TechStackAppendIntent: TechStackAppendIntentProtocol {
    private let model: (any TechStackAppendActionProtocol)?
    private let debouncer = Debouncer(for: 0.2)

    init(model: any TechStackAppendActionProtocol) {
        self.model = model
    }

    func updateSearchText(text: String) {
        model?.updateSearchText(text: text)
        debouncer { [weak self] in
            guard let self else { return }
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
    }
}
