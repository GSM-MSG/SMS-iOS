import BaseFeature
import InputProfileInfoFeatureInterface
import MajorDomainInterface
import NeedleFoundation
import SwiftUI
import TechStackAppendFeatureInterface

public protocol InputProfileInfoDependency: Dependency {
    var majorDomainBuildable: any MajorDomainBuildable { get }
    var techStackAppendBuildable: any TechStackAppendBuildable { get }
}

public final class InputProfileInfoComponent:
    Component<InputProfileInfoDependency>,
    InputProfileInfoBuildable {

    public func makeView(delegate: InputProfileDelegate) -> some View {
        let model = InputProfileInfoModel()
        let intent = InputProfileInfoIntent(
            model: model,
            inputProfileDelegate: delegate,
            fetchMajorListUseCase: dependency.majorDomainBuildable.fetchMajorListUseCase
        )
        let container = MVIContainer(
            intent: intent as InputProfileInfoIntentProtocol,
            model: model as InputProfileInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputProfileInfoView(
            container: container,
            techStackAppendBuildable: dependency.techStackAppendBuildable
        )
    }
}
