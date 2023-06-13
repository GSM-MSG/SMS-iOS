import BaseFeature
import InputInformationFeatureInterface
import SigninFeatureInterface
import MainFeatureInterface
import FilterFeatureInterface
import SwiftUI
import ViewUtil

struct RootView: View {
    @StateObject var container: MVIContainer<RootIntentProtocol, RootStateProtocol>
    var intent: any RootIntentProtocol { container.intent }
    var state: any RootStateProtocol { container.model }

    private let signinBuildable: any SigninBuildable
    private let inputInformationBuildable: any InputInformationBuildable
    private let mainBuildable: any MainBuildable
    private let filterBuildable: any FilterBuildable

    init(
        signinBuildable: any SigninBuildable,
        inputInformationBuildable: any InputInformationBuildable,
        mainBuildable: any MainBuildable,
        filterBuildable: any FilterBuildable,
        container: MVIContainer<RootIntentProtocol, RootStateProtocol>
    ) {
        self.signinBuildable = signinBuildable
        self.inputInformationBuildable = inputInformationBuildable
        self.mainBuildable = mainBuildable
        self.filterBuildable = filterBuildable
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        Group {
            switch state.sceneType {
            case .splash:
                Text("Splash")

            case .main:
                mainBuildable.makeView(delegate: intent)
                    .eraseToAnyView()

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
        .animation(.default, value: state.sceneType)
    }
}
