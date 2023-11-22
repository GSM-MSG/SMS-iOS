import BaseFeature
import DesignSystem
import InputPrizeInfoFeatureInterface
import InputProfileInfoFeatureInterface
import SwiftUI
import ViewUtil

struct InputInformationView: View {
    @StateObject var container: MVIContainer<InputInformationIntentProtocol, InputInformationStateProtocol>
    var intent: any InputInformationIntentProtocol { container.intent }
    var state: any InputInformationStateProtocol { container.model }
                                                                                                                  
    private let inputProfileInfoBuildable: any InputProfileInfoBuildable
    private let inputPrizeInfoBuildable: any InputPrizeInfoBuildable

    init(
        inputProfileInfoBuildable: any InputProfileInfoBuildable,
        inputPrizeInfoBuildable: any InputPrizeInfoBuildable,
        container: MVIContainer<InputInformationIntentProtocol, InputInformationStateProtocol>
    ) {
        self.inputProfileInfoBuildable = inputProfileInfoBuildable
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
