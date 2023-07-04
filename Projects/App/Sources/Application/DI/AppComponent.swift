import AuthDomain
import AuthDomainInterface
import BaseDomain
import FileDomain
import FileDomainInterface
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
import FilterFeature
import FilterFeatureInterface
import JwtStore
import JwtStoreInterface
import KeychainModule
import KeychainModuleInterface
import MainFeature
import MainFeatureInterface
import MajorDomain
import MajorDomainInterface
import NeedleFoundation
import RootFeature
import RootFeature
import SigninFeature
import SigninFeatureInterface
import SplashFeature
import SplashFeatureInterface
import StudentDetailFeature
import StudentDetailFeatureInterface
import StudentDomain
import StudentDomainInterface
import SwiftUI
import TechStackAppendFeature
import TechStackAppendFeatureInterface
import TechStackDomain
import TechStackDomainInterface
import UserDomain
import UserDomainInterface

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

    var mainBuildable: any MainBuildable {
        MainComponent(parent: self)
    }

    var techStackAppendBuildable: any TechStackAppendBuildable {
        TechStackAppendComponent(parent: self)
    }

    var studentDetailBuildable: any StudentDetailBuildable {
        StudentDetailComponent(parent: self)
    }

    var filterBuildable: any FilterBuildable {
        FilterComponent(parent: self)
    }

    var splashBuildable: any SplashBuildable {
        SplashComponent(parent: self)
    }

    var authDomainBuildable: any AuthDomainBuildable {
        AuthDomainComponent(parent: self)
    }

    var studentDomainBuildable: any StudentDomainBuildable {
        StudentDomainComponent(parent: self)
    }

    var majorDomainBuildable: any MajorDomainBuildable {
        MajorDomainComponent(parent: self)
    }

    var fileDomainBuildable: any FileDomainBuildable {
        FileDomainComponent(parent: self)
    }

    var userDomainBuildable: any UserDomainBuildable {
        UserDomainComponent(parent: self)
    }

    var techStackDomainBuildable: any TechStackDomainBuildable {
        TechStackDomainComponent(parent: self)
    }

    var jwtStoreBuildable: any JwtStoreBuildable {
        JwtStoreComponent(parent: self)
    }

    var keychainBuildable: any KeychainBuildable {
        KeychainComponent(parent: self)
    }
}
