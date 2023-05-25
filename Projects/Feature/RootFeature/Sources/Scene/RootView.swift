import BaseFeature
import InputInformationFeatureInterface
import SigninFeatureInterface
import SwiftUI
import ViewUtil

struct RootView: View {
    @StateObject var container: MVIContainer<RootIntentProtocol, RootStateProtocol>
    var intent: any RootIntentProtocol { container.intent }
    var state: any RootStateProtocol { container.model }

    private let signinBuildable: any SigninBuildable
    private let inputInformationBuildable: any InputInformationBuildable

    init(
        signinBuildable: any SigninBuildable,
        inputInformationBuildable: any InputInformationBuildable,
        container: MVIContainer<RootIntentProtocol, RootStateProtocol>
    ) {
        self.signinBuildable = signinBuildable
        self.inputInformationBuildable = inputInformationBuildable
        self._container = StateObject(wrappedValue: container)
    }

    @ViewBuilder
    var body: some View {
        switch state.sceneType {
        case .splash, .home:
            EmptyView()

        case .signin:
            signinBuildable.makeView()
                .eraseToAnyView()

        case .inputInformation:
            inputInformationBuildable.makeView(delegate: intent)
                .eraseToAnyView()
        }
    }
}
