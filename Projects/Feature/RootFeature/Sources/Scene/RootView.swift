import BaseFeature
import InputInformationFeatureInterface
import SigninFeatureInterface
import FilterFeatureInterface
import SwiftUI
import ViewUtil

struct RootView: View {
    @StateObject var container: MVIContainer<RootIntentProtocol, RootStateProtocol>
    var intent: any RootIntentProtocol { container.intent }
    var state: any RootStateProtocol { container.model }

    private let signinBuildable: any SigninBuildable
    private let inputInformationBuildable: any InputInformationBuildable
    private let filterBuildable: any FilterBuildable

    init(
        signinBuildable: any SigninBuildable,
        inputInformationBuildable: any InputInformationBuildable,
        filterBuildable: any FilterBuildable,
        container: MVIContainer<RootIntentProtocol, RootStateProtocol>
    ) {
        self.signinBuildable = signinBuildable
        self.inputInformationBuildable = inputInformationBuildable
        self.filterBuildable = filterBuildable
        self._container = StateObject(wrappedValue: container)
    }

    @ViewBuilder
    var body: some View {
        switch state.sceneType {
        case .splash:
            Text("Splash")

        case .home:
            Text("Home")

        case .signin:
            signinBuildable.makeView(delegate: intent)
                .eraseToAnyView()

        case .inputInformation:
            inputInformationBuildable.makeView(delegate: intent)
                .eraseToAnyView()

        case .filter:
            filterBuildable.makeView(delegate: intent)
                .eraseToAnyView()
        }
    }
}
