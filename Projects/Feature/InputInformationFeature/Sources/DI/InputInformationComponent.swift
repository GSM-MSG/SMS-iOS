import BaseFeature
import FileDomainInterface
import InputCertificateInfoFeatureInterface
import InputInformationFeatureInterface
import InputLanguageInfoFeatureInterface
import InputMilitaryInfoFeatureInterface
import InputProfileInfoFeatureInterface
import InputProjectInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import InputPrizeInfoFeatureInterface
import NeedleFoundation
import StudentDomainInterface
import SwiftUI

public protocol InputInformationDependency: Dependency {
    var inputProfileInfoBuildable: any InputProfileInfoBuildable { get }
    var inputSchoolLifeInfoBuildable: any InputSchoolListInfoBuildable { get }
    var inputWorkInfoBuildable: any InputWorkInfoBuildable { get }
    var inputMilitaryInfoBuildable: any InputMilitaryInfoBuildable { get }
    var inputCertificateInfoBuildable: any InputCertificateInfoBuildable { get }
    var inputLanguageInfoBuildable: any InputLanguageInfoBuildable { get }
    var inputProjectInfoBuildable: any InputProjectInfoBuildable { get }
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
            inputSchoolLifeInfoBuildable: dependency.inputSchoolLifeInfoBuildable,
            inputWorkInfoBuildable: dependency.inputWorkInfoBuildable,
            inputMilitaryInfoBuildable: dependency.inputMilitaryInfoBuildable,
            inputCertificateInfoBuildable: dependency.inputCertificateInfoBuildable,
            inputLanguageInfoBuildable: dependency.inputLanguageInfoBuildable,
            inputProjectInfoBuildable: dependency.inputProjectInfoBuildable,
            inputPrizeInfoBuildable: dependency.inputPrizeInfoBuildable,
            container: container
        )
    }
}
