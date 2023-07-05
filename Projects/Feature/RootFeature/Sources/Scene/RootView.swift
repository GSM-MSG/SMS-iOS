import BaseFeature
import InputInformationFeatureInterface
import MainFeatureInterface
import SigninFeatureInterface
import FilterFeatureInterface
import SplashFeatureInterface
import SwiftUI
import ViewUtil

struct RootView: View {
    @StateObject var container: MVIContainer<RootIntentProtocol, RootStateProtocol>
    var intent: any RootIntentProtocol { container.intent }
    var state: any RootStateProtocol { container.model }

    private let signinBuildable: any SigninBuildable
    private let inputInformationBuildable: any InputInformationBuildable
    private let mainBuildable: any MainBuildable
    private let splashBuildable: any SplashBuildable

    init(
        signinBuildable: any SigninBuildable,
        inputInformationBuildable: any InputInformationBuildable,
        mainBuildable: any MainBuildable,
        splashBuildable: any SplashBuildable,
        container: MVIContainer<RootIntentProtocol, RootStateProtocol>
    ) {
        self.signinBuildable = signinBuildable
        self.inputInformationBuildable = inputInformationBuildable
        self.mainBuildable = mainBuildable
        self.splashBuildable = splashBuildable
        self._container = StateObject(wrappedValue: container)
    }

    var body: some View {
        Group {
            switch state.sceneType {
            case .splash:
                splashBuildable.makeView(delegate: intent)
                    .eraseToAnyView()

            case .main:
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
        .animation(.default, value: state.sceneType)
    }
}
