import BaseFeature
import InputProjectInfoFeatureInterface
import NeedleFoundation
import SwiftUI
import TechStackAppendFeatureInterface
import FileDomainInterface

public protocol InputProjectInfoDependency: Dependency {
    var techStackAppendBuildable: any TechStackAppendBuildable { get }
    var fileDomainBuildable: any FileDomainBuildable { get }
}

public final class InputProjectInfoComponent:
    Component<InputProjectInfoDependency>,
    InputProjectInfoBuildable {
    public func makeView(delegate: any InputProjectInfoDelegate) -> some View {
        let model = InputProjectInfoModel()
        let intent = InputProjectInfoIntent(
            model: model,
            delegate: delegate,
            imageUploadUseCase: dependency.fileDomainBuildable.imageUploadUseCase
        )
        let container = MVIContainer(
            intent: intent as InputProjectInfoIntentProtocol,
            model: model as InputProjectInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputProjectInfoView(
            techStackAppendBuildable: dependency.techStackAppendBuildable,
            container: container
        )
    }
}
