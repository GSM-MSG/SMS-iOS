import BaseFeature
import SwiftUI

struct InputInformationView: View {
    @StateObject var container: MVIContainer<InputInformationIntentProtocol, InputInformationStateProtocol>
    var intent: any InputInformationIntentProtocol { container.intent }
    var state: any InputInformationStateProtocol { container.model }

    var body: some View {
        InputInformationPageWrapView(
            selection: Binding(
                get: { state.phase },
                set: { _ in }
            )
        ) {
            Text("a")
                .tag(InformationPhase.profile)

            Text("b")
                .tag(InformationPhase.school)
        }
    }
}
