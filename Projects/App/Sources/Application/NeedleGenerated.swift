

import AuthDomain
import AuthDomainInterface
import BaseDomain
import BaseFeature
import FileDomain
import FileDomainInterface
import FilterFeature
import FilterFeatureInterface
import Foundation
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
import MajorDomain
import MajorDomainInterface
import MyPageFeature
import MyPageFeatureInterface
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
private class SplashDependencye0cb7136f2ec3edfd60aProvider: SplashDependency {
    var authDomainBuildable: any AuthDomainBuildable {
        return appComponent.authDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SplashComponent
private func factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SplashDependencye0cb7136f2ec3edfd60aProvider(appComponent: parent1(component) as! AppComponent)
}
private class InputProjectInfoDependencye065c7f60c5c520999a0Provider: InputProjectInfoDependency {
    var techStackAppendBuildable: any TechStackAppendBuildable {
        return appComponent.techStackAppendBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputProjectInfoComponent
private func factory2378736e5949c5e8e9f4f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputProjectInfoDependencye065c7f60c5c520999a0Provider(appComponent: parent1(component) as! AppComponent)
}
private class MyPageDependency48d84b530313b3ee40feProvider: MyPageDependency {
    var userDomainBuildable: any UserDomainBuildable {
        return appComponent.userDomainBuildable
    }
    var authDomainBuildable: any AuthDomainBuildable {
        return appComponent.authDomainBuildable
    }
    var techStackAppendBuildable: any TechStackAppendBuildable {
        return appComponent.techStackAppendBuildable
    }
    var fileDomainBuildable: any FileDomainBuildable {
        return appComponent.fileDomainBuildable
    }
    var studentDomainBuildable: any StudentDomainBuildable {
        return appComponent.studentDomainBuildable
    }
    var majorDomainBuildable: any MajorDomainBuildable {
        return appComponent.majorDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MyPageComponent
private func factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MyPageDependency48d84b530313b3ee40feProvider(appComponent: parent1(component) as! AppComponent)
}
private class InputWorkInfoDependency74441f61366e4e5af9a2Provider: InputWorkInfoDependency {


    init() {

    }
}
/// ^->AppComponent->InputWorkInfoComponent
private func factoryfff86bd7854b30412216e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputWorkInfoDependency74441f61366e4e5af9a2Provider()
}
private class MainDependency7c6a5b4738b211b8e155Provider: MainDependency {
    var studentDomainBuildable: any StudentDomainBuildable {
        return appComponent.studentDomainBuildable
    }
    var filterBuildable: any FilterBuildable {
        return appComponent.filterBuildable
    }
    var myPageBuildable: any MyPageBuildable {
        return appComponent.myPageBuildable
    }
    var studentDetailBuildable: any StudentDetailBuildable {
        return appComponent.studentDetailBuildable
    }
    var userDomainBuildable: any UserDomainBuildable {
        return appComponent.userDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainComponent
private func factoryc9274e46e78e70f29c54f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainDependency7c6a5b4738b211b8e155Provider(appComponent: parent1(component) as! AppComponent)
}
private class InputSchoolLifeInfoDependency30edf0903f9bdb7a60fbProvider: InputSchoolLifeInfoDependency {


    init() {

    }
}
/// ^->AppComponent->InputSchoolLifeInfoComponent
private func factorydc1feebed8f042db375fe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputSchoolLifeInfoDependency30edf0903f9bdb7a60fbProvider()
}
private class FilterDependencya3adf5d0affb84ca15efProvider: FilterDependency {
    var techStackAppendBuildable: any TechStackAppendBuildable {
        return appComponent.techStackAppendBuildable
    }
    var majorDomainBuildable: any MajorDomainBuildable {
        return appComponent.majorDomainBuildable
    }
    var userDomainBuildable: any UserDomainBuildable {
        return appComponent.userDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FilterComponent
private func factoryf50b858bcdf190c46b17f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FilterDependencya3adf5d0affb84ca15efProvider(appComponent: parent1(component) as! AppComponent)
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var signinBuildable: any SigninBuildable {
        return appComponent.signinBuildable
    }
    var inputInformationBuildable: any InputInformationBuildable {
        return appComponent.inputInformationBuildable
    }
    var mainBuildable: any MainBuildable {
        return appComponent.mainBuildable
    }
    var splashBuildable: any SplashBuildable {
        return appComponent.splashBuildable
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
    var userDomainBuildable: any UserDomainBuildable {
        return appComponent.userDomainBuildable
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
private class TechStackAppendDependencycd739ed38983dbb168e8Provider: TechStackAppendDependency {
    var techStackDomainBuildable: any TechStackDomainBuildable {
        return appComponent.techStackDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->TechStackAppendComponent
private func factory84921fd8019bf910b0aff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return TechStackAppendDependencycd739ed38983dbb168e8Provider(appComponent: parent1(component) as! AppComponent)
}
private class InputInformationDependency7b32a8e7e8a8f0ab5466Provider: InputInformationDependency {
    var inputProfileInfoBuildable: any InputProfileInfoBuildable {
        return appComponent.inputProfileInfoBuildable
    }
    var inputSchoolLifeInfoBuildable: any InputSchoolListInfoBuildable {
        return appComponent.inputSchoolLifeInfoBuildable
    }
    var inputWorkInfoBuildable: any InputWorkInfoBuildable {
        return appComponent.inputWorkInfoBuildable
    }
    var inputMilitaryInfoBuildable: any InputMilitaryInfoBuildable {
        return appComponent.inputMilitaryInfoBuildable
    }
    var inputCertificateInfoBuildable: any InputCertificateInfoBuildable {
        return appComponent.inputCertificateInfoBuildable
    }
    var inputLanguageInfoBuildable: any InputLanguageInfoBuildable {
        return appComponent.inputLanguageInfoBuildable
    }
    var inputProjectInfoBuildable: any InputProjectInfoBuildable {
        return appComponent.inputProjectInfoBuildable
    }
    var inputPrizeInfoBuildable: any InputPrizeInfoBuildable {
        return appComponent.inputPrizeInfoBuildable
    }
    var fileDomainBuildable: any FileDomainBuildable {
        return appComponent.fileDomainBuildable
    }
    var studentDomainBuildable: any StudentDomainBuildable {
        return appComponent.studentDomainBuildable
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
private class StudentDetailDependencyf86509655a52b42363b7Provider: StudentDetailDependency {
    var userDomainBuildable: any UserDomainBuildable {
        return appComponent.userDomainBuildable
    }
    var studentDomainBuildable: any StudentDomainBuildable {
        return appComponent.studentDomainBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->StudentDetailComponent
private func factory3e27a26da31e522f5755f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return StudentDetailDependencyf86509655a52b42363b7Provider(appComponent: parent1(component) as! AppComponent)
}
private class InputProfileInfoDependencydedc6189ad35e7ff3001Provider: InputProfileInfoDependency {
    var majorDomainBuildable: any MajorDomainBuildable {
        return appComponent.majorDomainBuildable
    }
    var techStackAppendBuildable: any TechStackAppendBuildable {
        return appComponent.techStackAppendBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->InputProfileInfoComponent
private func factoryb3d74d9bff60efbc0282f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputProfileInfoDependencydedc6189ad35e7ff3001Provider(appComponent: parent1(component) as! AppComponent)
}
private class InputPrizeInfoDependencyff32e2191f3500ff4774Provider: InputPrizeInfoDependency {


    init() {

    }
}
/// ^->AppComponent->InputPrizeInfoComponent
private func factory4b0dfd60fcb5e700b51ce3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return InputPrizeInfoDependencyff32e2191f3500ff4774Provider()
}
private class FileDomainDependency2b4ac3753c2aa3928546Provider: FileDomainDependency {
    var jwtStoreBuildable: any JwtStoreBuildable {
        return appComponent.jwtStoreBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FileDomainComponent
private func factoryd99c631e7a9c4984df37f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FileDomainDependency2b4ac3753c2aa3928546Provider(appComponent: parent1(component) as! AppComponent)
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
private class TechStackDomainDependencyc7e8371994569e951d57Provider: TechStackDomainDependency {
    var jwtStoreBuildable: any JwtStoreBuildable {
        return appComponent.jwtStoreBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->TechStackDomainComponent
private func factory254149359ff45b2db35bf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return TechStackDomainDependencyc7e8371994569e951d57Provider(appComponent: parent1(component) as! AppComponent)
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
private class MajorDomainDependency4dd341ec0ebe68acad8bProvider: MajorDomainDependency {
    var jwtStoreBuildable: any JwtStoreBuildable {
        return appComponent.jwtStoreBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MajorDomainComponent
private func factoryc6563cd3e82b012ec3bef47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MajorDomainDependency4dd341ec0ebe68acad8bProvider(appComponent: parent1(component) as! AppComponent)
}
private class UserDomainDependencyf39d2a2922733361cbe1Provider: UserDomainDependency {
    var jwtStoreBuildable: any JwtStoreBuildable {
        return appComponent.jwtStoreBuildable
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->UserDomainComponent
private func factory46488402f315d7f9530cf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return UserDomainDependencyf39d2a2922733361cbe1Provider(appComponent: parent1(component) as! AppComponent)
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
extension SplashComponent: Registration {
    public func registerItems() {
        keyPathToName[\SplashDependency.authDomainBuildable] = "authDomainBuildable-any AuthDomainBuildable"
    }
}
extension InputProjectInfoComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputProjectInfoDependency.techStackAppendBuildable] = "techStackAppendBuildable-any TechStackAppendBuildable"
    }
}
extension MyPageComponent: Registration {
    public func registerItems() {
        keyPathToName[\MyPageDependency.userDomainBuildable] = "userDomainBuildable-any UserDomainBuildable"
        keyPathToName[\MyPageDependency.authDomainBuildable] = "authDomainBuildable-any AuthDomainBuildable"
        keyPathToName[\MyPageDependency.techStackAppendBuildable] = "techStackAppendBuildable-any TechStackAppendBuildable"
        keyPathToName[\MyPageDependency.fileDomainBuildable] = "fileDomainBuildable-any FileDomainBuildable"
        keyPathToName[\MyPageDependency.studentDomainBuildable] = "studentDomainBuildable-any StudentDomainBuildable"
        keyPathToName[\MyPageDependency.majorDomainBuildable] = "majorDomainBuildable-any MajorDomainBuildable"
    }
}
extension InputWorkInfoComponent: Registration {
    public func registerItems() {

    }
}
extension MainComponent: Registration {
    public func registerItems() {
        keyPathToName[\MainDependency.studentDomainBuildable] = "studentDomainBuildable-any StudentDomainBuildable"
        keyPathToName[\MainDependency.filterBuildable] = "filterBuildable-any FilterBuildable"
        keyPathToName[\MainDependency.myPageBuildable] = "myPageBuildable-any MyPageBuildable"
        keyPathToName[\MainDependency.studentDetailBuildable] = "studentDetailBuildable-any StudentDetailBuildable"
        keyPathToName[\MainDependency.userDomainBuildable] = "userDomainBuildable-any UserDomainBuildable"
    }
}
extension InputSchoolLifeInfoComponent: Registration {
    public func registerItems() {

    }
}
extension FilterComponent: Registration {
    public func registerItems() {
        keyPathToName[\FilterDependency.techStackAppendBuildable] = "techStackAppendBuildable-any TechStackAppendBuildable"
        keyPathToName[\FilterDependency.majorDomainBuildable] = "majorDomainBuildable-any MajorDomainBuildable"
        keyPathToName[\FilterDependency.userDomainBuildable] = "userDomainBuildable-any UserDomainBuildable"
    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.signinBuildable] = "signinBuildable-any SigninBuildable"
        keyPathToName[\RootDependency.inputInformationBuildable] = "inputInformationBuildable-any InputInformationBuildable"
        keyPathToName[\RootDependency.mainBuildable] = "mainBuildable-any MainBuildable"
        keyPathToName[\RootDependency.splashBuildable] = "splashBuildable-any SplashBuildable"
    }
}
extension SigninComponent: Registration {
    public func registerItems() {
        keyPathToName[\SigninDependency.authDomainBuildable] = "authDomainBuildable-any AuthDomainBuildable"
        keyPathToName[\SigninDependency.userDomainBuildable] = "userDomainBuildable-any UserDomainBuildable"
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
extension TechStackAppendComponent: Registration {
    public func registerItems() {
        keyPathToName[\TechStackAppendDependency.techStackDomainBuildable] = "techStackDomainBuildable-any TechStackDomainBuildable"
    }
}
extension InputInformationComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputInformationDependency.inputProfileInfoBuildable] = "inputProfileInfoBuildable-any InputProfileInfoBuildable"
        keyPathToName[\InputInformationDependency.inputSchoolLifeInfoBuildable] = "inputSchoolLifeInfoBuildable-any InputSchoolListInfoBuildable"
        keyPathToName[\InputInformationDependency.inputWorkInfoBuildable] = "inputWorkInfoBuildable-any InputWorkInfoBuildable"
        keyPathToName[\InputInformationDependency.inputMilitaryInfoBuildable] = "inputMilitaryInfoBuildable-any InputMilitaryInfoBuildable"
        keyPathToName[\InputInformationDependency.inputCertificateInfoBuildable] = "inputCertificateInfoBuildable-any InputCertificateInfoBuildable"
        keyPathToName[\InputInformationDependency.inputLanguageInfoBuildable] = "inputLanguageInfoBuildable-any InputLanguageInfoBuildable"
        keyPathToName[\InputInformationDependency.inputProjectInfoBuildable] = "inputProjectInfoBuildable-any InputProjectInfoBuildable"
        keyPathToName[\InputInformationDependency.inputPrizeInfoBuildable] = "inputPrizeInfoBuildable-any InputPrizeInfoBuildable"
        keyPathToName[\InputInformationDependency.fileDomainBuildable] = "fileDomainBuildable-any FileDomainBuildable"
        keyPathToName[\InputInformationDependency.studentDomainBuildable] = "studentDomainBuildable-any StudentDomainBuildable"
    }
}
extension InputCertificateInfoComponent: Registration {
    public func registerItems() {

    }
}
extension StudentDetailComponent: Registration {
    public func registerItems() {
        keyPathToName[\StudentDetailDependency.userDomainBuildable] = "userDomainBuildable-any UserDomainBuildable"
        keyPathToName[\StudentDetailDependency.studentDomainBuildable] = "studentDomainBuildable-any StudentDomainBuildable"
    }
}
extension InputProfileInfoComponent: Registration {
    public func registerItems() {
        keyPathToName[\InputProfileInfoDependency.majorDomainBuildable] = "majorDomainBuildable-any MajorDomainBuildable"
        keyPathToName[\InputProfileInfoDependency.techStackAppendBuildable] = "techStackAppendBuildable-any TechStackAppendBuildable"
    }
}
extension InputPrizeInfoComponent: Registration {
    public func registerItems() {

    }
}
extension FileDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\FileDomainDependency.jwtStoreBuildable] = "jwtStoreBuildable-any JwtStoreBuildable"
    }
}
extension StudentDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\StudentDomainDependency.jwtStoreBuildable] = "jwtStoreBuildable-any JwtStoreBuildable"
    }
}
extension TechStackDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\TechStackDomainDependency.jwtStoreBuildable] = "jwtStoreBuildable-any JwtStoreBuildable"
    }
}
extension AuthDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\AuthDomainDependency.jwtStoreBuildable] = "jwtStoreBuildable-any JwtStoreBuildable"
    }
}
extension MajorDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\MajorDomainDependency.jwtStoreBuildable] = "jwtStoreBuildable-any JwtStoreBuildable"
    }
}
extension UserDomainComponent: Registration {
    public func registerItems() {
        keyPathToName[\UserDomainDependency.jwtStoreBuildable] = "jwtStoreBuildable-any JwtStoreBuildable"
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
    registerProviderFactory("^->AppComponent->SplashComponent", factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputProjectInfoComponent", factory2378736e5949c5e8e9f4f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MyPageComponent", factory0f6f456ebf157d02dfb3f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputWorkInfoComponent", factoryfff86bd7854b30412216e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MainComponent", factoryc9274e46e78e70f29c54f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputSchoolLifeInfoComponent", factorydc1feebed8f042db375fe3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->FilterComponent", factoryf50b858bcdf190c46b17f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputMilitaryInfoComponent", factory6e35522c47cca1190471e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->InputLanguageInfoComponent", factory36893d70245037098109e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->TechStackAppendComponent", factory84921fd8019bf910b0aff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputInformationComponent", factory0b9613d8c923fa9ae897f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputCertificateInfoComponent", factory9df85876e39e1206b924e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->StudentDetailComponent", factory3e27a26da31e522f5755f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputProfileInfoComponent", factoryb3d74d9bff60efbc0282f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->InputPrizeInfoComponent", factory4b0dfd60fcb5e700b51ce3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->FileDomainComponent", factoryd99c631e7a9c4984df37f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->StudentDomainComponent", factory2686a7e321a220c3265af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->TechStackDomainComponent", factory254149359ff45b2db35bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->AuthDomainComponent", factoryc9b20c320bb79402d4c1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MajorDomainComponent", factoryc6563cd3e82b012ec3bef47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->UserDomainComponent", factory46488402f315d7f9530cf47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
