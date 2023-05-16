

import AuthDomain
import AuthDomainInterface
import BaseDomain
import BaseFeature
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
import JwtStore
import JwtStoreInterface
import KeychainModule
import KeychainModuleInterface
import NeedleFoundation
import RootFeature
import SigninFeature
import SigninFeatureInterface
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class JwtStoreDependency5613ee3d4fea5093f6faProvider: JwtStoreDependency {
    var keychainBuildable: any KeychainBuildable {
        return appComponent.keychainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->JwtStoreComponent
private func factoryb27d5aae1eb7e73575a6f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return JwtStoreDependency5613ee3d4fea5093f6faProvider(appComponent: parent1(component) as! AppComponent)
}
private class InputWorkInfoDependency74441f61366e4e5af9a2Provider: InputWorkInfoDependency {


    init() {

    }
}
/// ^->AppComponent->InputWorkInfoComponent
private func factoryfff86bd7854b30412216e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputWorkInfoDependency74441f61366e4e5af9a2Provider()
}
private class InputSchoolLifeInfoDependency30edf0903f9bdb7a60fbProvider: InputSchoolLifeInfoDependency {


    init() {

    }
}
/// ^->AppComponent->InputSchoolLifeInfoComponent
private func factorydc1feebed8f042db375fe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputSchoolLifeInfoDependency30edf0903f9bdb7a60fbProvider()
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var signinBuildable: any SigninBuildable {
        return appComponent.signinBuildable
    }
    var inputInformationBuildable: any InputInformationBuildable {
        return appComponent.inputInformationBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider(appComponent: parent1(component) as! AppComponent)
}
private class SigninDependencyde06a9d0b22764487733Provider: SigninDependency {
    var authDomainBuildable: any AuthDomainBuildable {
        return appComponent.authDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SigninComponent
private func factory2882a056d84a613debccf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SigninDependencyde06a9d0b22764487733Provider(appComponent: parent1(component) as! AppComponent)
}
private class InputMilitaryInfoDependency0cd58f3f7088aec361b6Provider: InputMilitaryInfoDependency {


    init() {

    }
}
/// ^->AppComponent->InputMilitaryInfoComponent
private func factory6e35522c47cca1190471e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputMilitaryInfoDependency0cd58f3f7088aec361b6Provider()
}
private class InputLanguageInfoDependencye83ef16d0fe38d31cb64Provider: InputLanguageInfoDependency {


    init() {

    }
}
/// ^->AppComponent->InputLanguageInfoComponent
private func factory36893d70245037098109e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputLanguageInfoDependencye83ef16d0fe38d31cb64Provider()
}
private class InputInformationDependency7b32a8e7e8a8f0ab5466Provider: InputInformationDependency {
    var inputProfileInfoBuildable: any InputProfileInfoBuildable {
        return appComponent.inputProfileInfoBuildable
    }
    var inputSchoolLifeInfoBuildable: any InputSchoolListInfoBuildable {
        return appComponent.inputSchoolLifeInfoBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputInformationComponent
private func factory0b9613d8c923fa9ae897f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputInformationDependency7b32a8e7e8a8f0ab5466Provider(appComponent: parent1(component) as! AppComponent)
}
private class InputCertificateInfoDependencyd369771b4dc3e8540791Provider: InputCertificateInfoDependency {


    init() {

    }
}
/// ^->AppComponent->InputCertificateInfoComponent
private func factory9df85876e39e1206b924e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputCertificateInfoDependencyd369771b4dc3e8540791Provider()
}
private class InputProfileInfoDependencydedc6189ad35e7ff3001Provider: InputProfileInfoDependency {


    init() {

    }
}
/// ^->AppComponent->InputProfileInfoComponent
private func factoryb3d74d9bff60efbc0282e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputProfileInfoDependencydedc6189ad35e7ff3001Provider()
}
private class AuthDomainDependency4518b8977185a5c9ff71Provider: AuthDomainDependency {
    var jwtStoreBuildable: any JwtStoreBuildable {
        return appComponent.jwtStoreBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->AuthDomainComponent
private func factoryc9b20c320bb79402d4c1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return AuthDomainDependency4518b8977185a5c9ff71Provider(appComponent: parent1(component) as! AppComponent)
}

#else
extension JwtStoreComponent: Registration {
    public func registerItems() {
        keyPathToName[\JwtStoreDependency.keychainBuildable] = "keychainBuildable-any KeychainBuildable"
    }
}
extension AppComponent: Registration {
    public func registerItems() {


    }
}
extension KeychainComponent: Registration {
    public func registerItems() {

    }
}
extension InputWorkInfoComponent: Registration {
    public func registerItems() {

    }
}
extension InputSchoolLifeInfoComponent: Registration {
    public func registerItems() {

    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.signinBuildable] = "signinBuildable-any SigninBuildable"
        keyPathToName[\RootDependency.inputInformationBuildable] = "inputInformationBuildable-any InputInformationBuildable"
    }
}
extension SigninComponent: Registration {
    public func registerItems() {
        keyPathToName[\SigninDependency.authDomainBuildable] = "authDomainBuildable-any AuthDomainBuildable"
    }
}
extension InputMilitaryInfoComponent: Registration {
    public func registerItems() {

    }
}
extension InputLanguageInfoComponent: Registration {
    public func registerItems() {

    }
}
extension InputInformationComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputInformationDependency.inputProfileInfoBuildable] = "inputProfileInfoBuildable-any InputProfileInfoBuildable"
        keyPathToName[\InputInformationDependency.inputSchoolLifeInfoBuildable] = "inputSchoolLifeInfoBuildable-any InputSchoolListInfoBuildable"
    }
}
extension InputCertificateInfoComponent: Registration {
    public func registerItems() {

    }
}
extension InputProfileInfoComponent: Registration {
    public func registerItems() {

    }
}
extension AuthDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\AuthDomainDependency.jwtStoreBuildable] = "jwtStoreBuildable-any JwtStoreBuildable"
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent->JwtStoreComponent", factoryb27d5aae1eb7e73575a6f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->KeychainComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->InputWorkInfoComponent", factoryfff86bd7854b30412216e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->InputSchoolLifeInfoComponent", factorydc1feebed8f042db375fe3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputMilitaryInfoComponent", factory6e35522c47cca1190471e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->InputLanguageInfoComponent", factory36893d70245037098109e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->InputInformationComponent", factory0b9613d8c923fa9ae897f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputCertificateInfoComponent", factory9df85876e39e1206b924e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->InputProfileInfoComponent", factoryb3d74d9bff60efbc0282e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->AuthDomainComponent", factoryc9b20c320bb79402d4c1f47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
