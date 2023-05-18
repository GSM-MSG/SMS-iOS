import BaseFeature
import InputInformationFeatureInterface
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import InputMilitaryInfoFeatureInterface
import InputLanguageInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputInformationDependency: Dependency {
    var inputProfileInfoBuildable: any InputProfileInfoBuildable { get }
    var inputSchoolLifeInfoBuildable: any InputSchoolListInfoBuildable { get }
    var inputWorkInfoBuildable: any InputWorkInfoBuildable { get }
    var inputMilitaryInfoBuildable: any InputMilitaryInfoBuildable { get }
    var inputLanguageInfoBuildable: any InputLanguageInfoBuildable { get }
}

public final class InputInformationComponent:
    Component<InputInformationDependency>,
    InputInformationBuildable {

    public func makeView() -> some View {
        let model = InputInformationModel()
        let intent = InputInformationIntent(model: model)
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
            inputLanguageInfoBuildable: dependency.inputLanguageInfoBuildable,
            container: container
        )
    }
}
