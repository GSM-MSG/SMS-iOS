import AuthDomain
import AuthDomainInterface
import BaseDomain
import FileDomain
import FileDomainInterface
import FilterFeature
import FilterFeatureInterface
import InputCertificateInfoFeature
import InputCertificateInfoFeatureInterface
import InputInformationFeature
import InputInformationFeatureInterface
import InputLanguageInfoFeature
import InputLanguageInfoFeatureInterface
import InputMilitaryInfoFeature
import InputMilitaryInfoFeatureInterface
import InputPrizeInfoFeature
import InputPrizeInfoFeatureInterface
import InputProfileInfoFeature
import InputProfileInfoFeatureInterface
import InputProjectInfoFeature
import InputProjectInfoFeatureInterface
import InputSchoolLifeInfoFeature
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeature
import InputWorkInfoFeatureInterface
import JwtStore
import JwtStoreInterface
import KeychainModule
import KeychainModuleInterface
import MainFeature
import MainFeatureInterface
import MyPageFeature
import MyPageFeatureInterface
import MajorDomain
import MajorDomainInterface
import NeedleFoundation
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

    public var rootComponent: RootComponent {
        RootComponent(parent: self)
    }

    public var signinBuildable: any SigninBuildable {
        SigninComponent(parent: self)
    }

    public var inputInformationBuildable: any InputInformationBuildable {
        InputInformationComponent(parent: self)
    }

    public var inputProfileInfoBuildable: any InputProfileInfoBuildable {
        InputProfileInfoComponent(parent: self)
    }

    public var inputSchoolLifeInfoBuildable: any InputSchoolLifeInfoBuildable {
        InputSchoolLifeInfoComponent(parent: self)
    }

    public var inputWorkInfoBuildable: any InputWorkInfoBuildable {
        InputWorkInfoComponent(parent: self)
    }

    public var inputMilitaryInfoBuildable: any InputMilitaryInfoBuildable {
        InputMilitaryInfoComponent(parent: self)
    }

    public var inputCertificateInfoBuildable: any InputCertificateInfoBuildable {
        InputCertificateInfoComponent(parent: self)
    }

    public var inputLanguageInfoBuildable: any InputLanguageInfoBuildable {
        InputLanguageInfoComponent(parent: self)
    }

    public var inputPrizeInfoBuildable: any InputPrizeInfoBuildable {
        InputPrizeInfoComponent(parent: self)
    }

    public var inputProjectInfoBuildable: any InputProjectInfoBuildable {
        InputProjectInfoComponent(parent: self)
    }

    public var mainBuildable: any MainBuildable {
        MainComponent(parent: self)
    }

    public var myPageBuildable: any MyPageBuildable {
        MyPageComponent(parent: self)
    }

    public var techStackAppendBuildable: any TechStackAppendBuildable {
        TechStackAppendComponent(parent: self)
    }

    public var studentDetailBuildable: any StudentDetailBuildable {
        StudentDetailComponent(parent: self)
    }

    public var filterBuildable: any FilterBuildable {
        FilterComponent(parent: self)
    }

    public var splashBuildable: any SplashBuildable {
        SplashComponent(parent: self)
    }

    public var authDomainBuildable: any AuthDomainBuildable {
        AuthDomainComponent(parent: self)
    }

    public var studentDomainBuildable: any StudentDomainBuildable {
        StudentDomainComponent(parent: self)
    }

    public var majorDomainBuildable: any MajorDomainBuildable {
        MajorDomainComponent(parent: self)
    }

    public var fileDomainBuildable: any FileDomainBuildable {
        FileDomainComponent(parent: self)
    }

    public var userDomainBuildable: any UserDomainBuildable {
        UserDomainComponent(parent: self)
    }

    public var techStackDomainBuildable: any TechStackDomainBuildable {
        TechStackDomainComponent(parent: self)
    }

    public var jwtStoreBuildable: any JwtStoreBuildable {
        JwtStoreComponent(parent: self)
    }

    public var keychainBuildable: any KeychainBuildable {
        KeychainComponent(parent: self)
    }
}
