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
import RootFeature
import TechStackAppendFeatureInterface
import TechStackAppendFeature
import TechStackDomainInterface
import TechStackDomain
import JwtStore
import JwtStoreInterface
import KeychainModule
import KeychainModuleInterface
import MajorDomain
import MajorDomainInterface
import NeedleFoundation
import RootFeature
import SigninFeature
import SigninFeatureInterface
import StudentDomain
import StudentDomainInterface
import StudentDetailFeature
import StudentDetailFeatureInterface
import SwiftUI
import UserDomain
import UserDomainInterface

final class AppComponent: BootstrapComponent {
    func makeRootView() -> some View {
        studentDetailBuildable.makeView(userID: "156a0b0b-5da5-4a17-befd-51bd48a157f2", with: Namespace().wrappedValue)
            .eraseToAnyView()
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

    var techStackAppendBuildable: any TechStackAppendBuildable {
        TechStackAppendComponent(parent: self)
    }

    var studentDetailBuildable: any StudentDetailBuildable {
        StudentDetailComponent(parent: self)
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
