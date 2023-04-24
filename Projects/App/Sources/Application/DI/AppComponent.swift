import NeedleFoundation
import SwiftUI
import AuthDomainInterface
import AuthDomain
import SigninFeature
import BaseDomain
import JwtStore
import JwtStoreInterface
import KeychainModule
import KeychainModuleInterface

final class AppComponent: BootstrapComponent {
    func makeRootView() -> some View {
        signinComponent.makeView()
    }

    var signinComponent: SigninComponent {
        SigninComponent(parent: self)
    }

    var authDomainComponentProtocol: any AuthDomainComponentProtocol {
        AuthDomainComponent(parent: self)
    }

    var jwtStoreComponentProtocol: any JwtStoreComponentProtocol {
        JwtStoreComponent(parent: self)
    }

    var keychainComponentProtocol: any KeychainComponentProtocol {
        KeychainComponent(parent: self)
    }
}
