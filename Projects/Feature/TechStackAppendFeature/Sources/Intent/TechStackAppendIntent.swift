import EventLimiter
import Foundation
import TechStackDomainInterface

final class TechStackAppendIntent: TechStackAppendIntentProtocol {
    private let model: (any TechStackAppendActionProtocol)?
    private let fetchTechStackListUseCase: any FetchTechStackListUseCase
    private let completion: ([String]) -> Void
    private let debouncer = Debouncer(for: 0.2)

    init(
        model: any TechStackAppendActionProtocol,
        fetchTechStackListUseCase: any FetchTechStackListUseCase,
        completion: @escaping ([String]) -> Void
    ) {
        self.model = model
        self.fetchTechStackListUseCase = fetchTechStackListUseCase
        self.completion = completion
    }

    func updateSearchText(text: String) {
        model?.updateSearchText(text: text)
        debouncer { [weak self] in
            guard let self else { return }
            do {
                let techStacks = try await self.fetchTechStackListUseCase.execute(keyword: text)
                self.model?.updateTechStacks(stacks: techStacks)
            } catch {
                return
            }
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

    func directAppendButtonDidTap(techStack: String) {
        model?.appendDirectTechStacks(stack: techStack)
    }
}
