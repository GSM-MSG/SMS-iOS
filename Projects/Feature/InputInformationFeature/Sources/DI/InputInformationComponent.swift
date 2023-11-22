import BaseFeature
import FileDomainInterface
import InputInformationFeatureInterface
import InputProfileInfoFeatureInterface
import InputPrizeInfoFeatureInterface
import NeedleFoundation
import StudentDomainInterface
import SwiftUI

public protocol InputInformationDependency: Dependency {
    var inputProfileInfoBuildable: any InputProfileInfoBuildable { get }
    var inputPrizeInfoBuildable: any InputPrizeInfoBuildable { get }
    var fileDomainBuildable: any FileDomainBuildable { get }
    var studentDomainBuildable: any StudentDomainBuildable { get }
}

public final class InputInformationComponent:
    Component<InputInformationDependency>,
    InputInformationBuildable {

    public func makeView(delegate: any InputInformationDelegate) -> some View {
        let model = InputInformationModel()
        let intent = InputInformationIntent(
            model: model,
            inputInformationDelegate: delegate,
            imageUploadUseCase: dependency.fileDomainBuildable.imageUploadUseCase,
            inputInformationUseCase: dependency.studentDomainBuildable.inputInformationUseCase
        )
        let container = MVIContainer(
            intent: intent as InputInformationIntentProtocol,
            model: model as InputInformationStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputInformationView(
            inputProfileInfoBuildable: dependency.inputProfileInfoBuildable,
            inputPrizeInfoBuildable: dependency.inputPrizeInfoBuildable,
            container: container
        )
    }
}
