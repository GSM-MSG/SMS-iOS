import AuthDomain
import AuthDomainInterface
import StudentDomain
import StudentDomainInterface
import FileDomain
import FileDomainInterface
import BaseDomain
import InputCertificateInfoFeature
import InputCertificateInfoFeatureInterface
import InputInformationFeature
import InputInformationFeatureInterface
import InputLanguageInfoFeature
import InputLanguageInfoFeatureInterface
import InputMilitaryInfoFeature
import InputMilitaryInfoFeatureInterface
import InputProfileInfoFeature
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeature
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeature
import InputWorkInfoFeatureInterface
import RootFeature
import JwtStore
import JwtStoreInterface
import KeychainModule
import KeychainModuleInterface
import NeedleFoundation
import SigninFeature
import SigninFeatureInterface
import SwiftUI

final class AppComponent: BootstrapComponent {
    func makeRootView() -> some View {
        rootComponent.makeView()
    }

    var rootComponent: RootComponent {
        RootComponent(parent: self)
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

    var studentDomainBuildable: any StudentDomainBuildable {
        StudentDomainComponent(parent: self)
    }

    var fileDomainBuildable: any FileDomainBuildable {
        FileDomainComponent(parent: self)
    }

    var jwtStoreBuildable: any JwtStoreBuildable {
        JwtStoreComponent(parent: self)
    }

    var keychainBuildable: any KeychainBuildable {
        KeychainComponent(parent: self)
    }
}
