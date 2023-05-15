import BaseFeature
import InputProfileInfoFeatureInterface
import SwiftUI
import ViewUtil

struct InputInformationView: View {
    @StateObject var container: MVIContainer<InputInformationIntentProtocol, InputInformationStateProtocol>
    var intent: any InputInformationIntentProtocol { container.intent }
    var state: any InputInformationStateProtocol { container.model }

    private let inputProfileInfoBuildable: any InputProfileInfoBuildable

    init(
        inputProfileInfoBuildable: any InputProfileInfoBuildable,
        container: MVIContainer<InputInformationIntentProtocol, InputInformationStateProtocol>
    ) {
        self.inputProfileInfoBuildable = inputProfileInfoBuildable
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        NavigationView {
            InputInformationPageWrapView(
                selection: Binding(
                    get: { state.phase },
                    set: { _ in }
                )
            ) {
                inputProfileInfoBuildable.makeView()
                    .eraseToAnyView()
                    .tag(InformationPhase.profile)

                Text("b")
                    .tag(InformationPhase.school)
            }
        }
        .navigationViewStyle(.stack)
    }
}
