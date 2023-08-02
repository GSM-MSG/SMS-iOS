import BaseFeature
import DesignSystem
import InputCertificateInfoFeatureInterface
import InputLanguageInfoFeatureInterface
import InputMilitaryInfoFeatureInterface
import InputPrizeInfoFeatureInterface
import InputProfileInfoFeatureInterface
import InputProjectInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import SwiftUI
import ViewUtil

struct InputInformationView: View {
    @StateObject var container: MVIContainer<InputInformationIntentProtocol, InputInformationStateProtocol>
    var intent: any InputInformationIntentProtocol { container.intent }
    var state: any InputInformationStateProtocol { container.model }

    private let inputProfileInfoBuildable: any InputProfileInfoBuildable
    private let inputSchoolLifeInfoBuildable: any InputSchoolListInfoBuildable
    private let inputWorkInfoBuildable: any InputWorkInfoBuildable
    private let inputMilitaryInfoBuildable: any InputMilitaryInfoBuildable
    private let inputCertificateInfoBuildable: any InputCertificateInfoBuildable
    private let inputLanguageInfoBuildable: any InputLanguageInfoBuildable
    private let inputProjectInfoBuildable: any InputProjectInfoBuildable
    private let inputPrizeInfoBuildable: any InputPrizeInfoBuildable

    init(
        inputProfileInfoBuildable: any InputProfileInfoBuildable,
        inputSchoolLifeInfoBuildable: any InputSchoolListInfoBuildable,
        inputWorkInfoBuildable: any InputWorkInfoBuildable,
        inputMilitaryInfoBuildable: any InputMilitaryInfoBuildable,
        inputCertificateInfoBuildable: any InputCertificateInfoBuildable,
        inputLanguageInfoBuildable: any InputLanguageInfoBuildable,
        inputProjectInfoBuildable: any InputProjectInfoBuildable,
        inputPrizeInfoBuildable: any InputPrizeInfoBuildable,
        container: MVIContainer<InputInformationIntentProtocol, InputInformationStateProtocol>
    ) {
        self.inputProfileInfoBuildable = inputProfileInfoBuildable
        self.inputSchoolLifeInfoBuildable = inputSchoolLifeInfoBuildable
        self.inputWorkInfoBuildable = inputWorkInfoBuildable
        self.inputMilitaryInfoBuildable = inputMilitaryInfoBuildable
        self.inputCertificateInfoBuildable = inputCertificateInfoBuildable
        self.inputLanguageInfoBuildable = inputLanguageInfoBuildable
        self.inputProjectInfoBuildable = inputProjectInfoBuildable
        self.inputPrizeInfoBuildable = inputPrizeInfoBuildable
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

            inputSchoolLifeInfoBuildable.makeView(delegate: intent)
                .eraseToAnyView()
                .tag(InformationPhase.school)

            inputWorkInfoBuildable.makeView(delegate: intent)
                .eraseToAnyView()
                .tag(InformationPhase.workCondition)

            inputMilitaryInfoBuildable.makeView(delegate: intent)
                .eraseToAnyView()
                .tag(InformationPhase.military)

            inputCertificateInfoBuildable.makeView(delegate: intent)
                .eraseToAnyView()
                .tag(InformationPhase.certificate)

            inputLanguageInfoBuildable.makeView(delegate: intent)
                .eraseToAnyView()
                .tag(InformationPhase.language)

            inputProjectInfoBuildable.makeView(delegate: intent)
                .eraseToAnyView()
                .tag(InformationPhase.project)

            inputPrizeInfoBuildable.makeView(delegate: intent)
                .eraseToAnyView()
                .tag(InformationPhase.prize)
        }
        .ignoresSafeArea(.container, edges: .top)
        .smsAlert(
            title: "정보입력 실패",
            description: state.errorMessage,
            isShowing: Binding(
                get: { state.isError },
                set: { _ in intent.errorAlertDismissed() }
            ),
            alertActions: [
                .init(text: "확인") {
                    intent.errorAlertDismissed()
                }
            ]
        )
        .animation(.default, value: state.phase)
        .onChange(of: state.isCompleteToInputAllInfo) { newValue in
            if newValue {
                intent.completeToInputAllInfo(state: state)
            }
        }
        .smsLoading(isLoading: state.isLoading)
    }
}
