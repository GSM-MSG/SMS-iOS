

import AuthDomain
import AuthDomainInterface
import BaseDomain
import BaseFeature
import InputCertificateInfoFeatureInterface
import InputInformationFeatureInterface
import InputLanguageInfoFeatureInterface
import InputMilitaryInfoFeatureInterface
import InputProfileInfoFeatureInterface
import InputSchoolLifeInfoFeatureInterface
import InputWorkInfoFeatureInterface
import JwtStore
import JwtStoreInterface
import KeychainModule
import KeychainModuleInterface
import NeedleFoundation
import SigninFeature
import SigninFeatureInterface
import StudentDomain
import StudentDomainInterface
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
private class StudentDomainDependency71a7287ffa1377bc3ca1Provider: StudentDomainDependency {
    var jwtStoreBuildable: any JwtStoreBuildable {
        return appComponent.jwtStoreBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->StudentDomainComponent
private func factory2686a7e321a220c3265af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return StudentDomainDependency71a7287ffa1377bc3ca1Provider(appComponent: parent1(component) as! AppComponent)
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
extension SigninComponent: Registration {
    public func registerItems() {
        keyPathToName[\SigninDependency.authDomainBuildable] = "authDomainBuildable-any AuthDomainBuildable"
    }
}
extension StudentDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\StudentDomainDependency.jwtStoreBuildable] = "jwtStoreBuildable-any JwtStoreBuildable"
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

private func register1() {
    registerProviderFactory("^->AppComponent->JwtStoreComponent", factoryb27d5aae1eb7e73575a6f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->KeychainComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->StudentDomainComponent", factory2686a7e321a220c3265af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AuthDomainComponent", factoryc9b20c320bb79402d4c1f47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
