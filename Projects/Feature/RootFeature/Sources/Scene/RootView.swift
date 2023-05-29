import BaseFeature
import InputInformationFeatureInterface
import SigninFeatureInterface
import MainFeatureInterface
import SwiftUI
import ViewUtil

struct RootView: View {
    @StateObject var container: MVIContainer<RootIntentProtocol, RootStateProtocol>
    var intent: any RootIntentProtocol { container.intent }
    var state: any RootStateProtocol { container.model }

    private let signinBuildable: any SigninBuildable
    private let inputInformationBuildable: any InputInformationBuildable
    private let mainBuildable: any MainBuildable

    init(
        signinBuildable: any SigninBuildable,
        inputInformationBuildable: any InputInformationBuildable,
        mainBuildable: any MainBuildable,
        container: MVIContainer<RootIntentProtocol, RootStateProtocol>
    ) {
        self.signinBuildable = signinBuildable
        self.inputInformationBuildable = inputInformationBuildable
        self.mainBuildable = mainBuildable
        self._container = StateObject(wrappedValue: container)
    }

    @ViewBuilder
    var body: some View {
        switch state.sceneType {
        case .splash:
            Text("Splash")

        case .home:
            mainBuildable.makeView(delegate: intent)
                .eraseToAnyView()

        case .signin:
            signinBuildable.makeView(delegate: intent)
                .eraseToAnyView()

        case .inputInformation:
            inputInformationBuildable.makeView(delegate: intent)
                .eraseToAnyView()
        }
    }
}
