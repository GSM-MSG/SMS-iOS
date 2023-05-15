import NeedleFoundation
import SwiftUI
import AuthDomainInterface
import AuthDomain
import SigninFeature
import SigninFeatureInterface
import InputInformationFeature
import InputInformationFeatureInterface
import InputProfileInfoFeature
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeature
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeature
import InputWorkInfoFeatureInterface
import InputMilitaryInfoFeature
import InputMilitaryInfoFeatureInterface
import InputCertificateInfoFeature
import InputCertificateInfoFeatureInterface
import InputLanguageInfoFeature
import InputLanguageInfoFeatureInterface
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

    var inputInformationBuildable: any InputInformationBuildable {
        InputInformationComponent(parent: self)
    }

    var inputProfileInfoBuildable: any InputProfileInfoBuildable {
        InputProfileInfoComponent(parent: self)
    }

    var inputSchoolLifeInfoBuildable: any InputSchoolListInfoBuildable {
        InputSchoolLifeInfoComponent(parent: self)
    }

    var inputWorkInfoBuildable: any InputWorkInfoBuildable {
        InputWorkInfoComponent(parent: self)
    }

    var inputMilitaryInfoBuildable: any InputMilitaryInfoBuildable {
        InputMilitaryInfoComponent(parent: self)
    }

    var inputCertificateInfoBuildable: any InputCertificateInfoBuildable {
        InputCertificateInfoComponent(parent: self)
    }

    var inputLanguageInfoBuildable: any InputLanguageInfoBuildable {
        InputLanguageInfoComponent(parent: self)
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
