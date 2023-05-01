import NeedleFoundation
import SwiftUI
import AuthDomainInterface
import AuthDomain
import SigninFeature
import SigninFeatureInterface
import BaseDomain
import JwtStore
import JwtStoreInterface
import KeychainModule
import KeychainModuleInterface

final class AppComponent: BootstrapComponent {
    func makeRootView() -> some View {
        signinBuildable.makeView().eraseToAnyView()
    }

    var signinBuildable: any SigninBuildable {
        SigninComponent(parent: self)
    }

    var authDomainBuildable: any AuthDomainBuildable {
        AuthDomainComponent(parent: self)
    }

    var jwtStoreBuildable: any JwtStoreBuildable {
        JwtStoreComponent(parent: self)
    }

    var keychainBuildable: any KeychainBuildable {
        KeychainComponent(parent: self)
    }
}
