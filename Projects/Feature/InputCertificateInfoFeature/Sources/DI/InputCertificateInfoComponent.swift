import BaseFeature
import InputCertificateInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputCertificateInfoDependency: Dependency {}

public final class InputCertificateInfoComponent:
    Component<InputCertificateInfoDependency>,
    InputCertificateInfoBuildable {

    public func makeView(delegate: InputCertificateDelegate) -> some View {
        let model = InputCertificateInfoModel()
        let intent = InputCertificateInfoIntent(model: model, certificateDelegate: delegate)
        let container = MVIContainer(
            intent: intent as InputCertificateInfoIntentProtocol,
            model: model as InputCertificateInfoStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return InputCertificateInfoView(container: container)
    }
}
