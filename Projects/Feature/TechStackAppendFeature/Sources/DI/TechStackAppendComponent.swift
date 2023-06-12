import BaseFeature
import NeedleFoundation
import SwiftUI
import TechStackAppendFeatureInterface
import TechStackDomainInterface

public protocol TechStackAppendDependency: Dependency {
    var techStackDomainBuildable: any TechStackDomainBuildable { get }
}

public final class TechStackAppendComponent: Component<TechStackAppendDependency>, TechStackAppendBuildable {
    public func makeView(completion: @escaping ([String]) -> Void) -> some View {
        let model = TechStackAppendModel()
        let intent = TechStackAppendIntent(
            model: model,
            fetchTechStackListUseCase: dependency.techStackDomainBuildable.fetchTechStackListUseCase,
            completion: completion
        )
        let container = MVIContainer(
            intent: intent as TechStackAppendIntentProtocol,
            model: model as TechStackAppendStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return TechStackAppendView(container: container)
    }
}
