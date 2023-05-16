import BaseFeature
import DesignSystem
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import SwiftUI
import ViewUtil

struct InputInformationView: View {
    @StateObject var container: MVIContainer<InputInformationIntentProtocol, InputInformationStateProtocol>
    var intent: any InputInformationIntentProtocol { container.intent }
    var state: any InputInformationStateProtocol { container.model }

    private let inputProfileInfoBuildable: any InputProfileInfoBuildable
    private let inputSchoolLifeInfoBuildable: any InputSchoolListInfoBuildable

    init(
        inputProfileInfoBuildable: any InputProfileInfoBuildable,
        inputSchoolLifeInfoBuildable: any InputSchoolListInfoBuildable,
        container: MVIContainer<InputInformationIntentProtocol, InputInformationStateProtocol>
    ) {
        self.inputProfileInfoBuildable = inputProfileInfoBuildable
        self.inputSchoolLifeInfoBuildable = inputSchoolLifeInfoBuildable
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        InputInformationPageWrapView(
            selection: Binding(
                get: { state.phase },
                set: { _ in }
            )
        ) {
            inputProfileInfoBuildable.makeView(delegate: intent)
                .eraseToAnyView()
                .tag(InformationPhase.profile)

            inputSchoolLifeInfoBuildable.makeView()
                .eraseToAnyView()
                .tag(InformationPhase.school)
        }
        .animation(.default, value: state.phase)
        .ignoresSafeArea()
    }
}
