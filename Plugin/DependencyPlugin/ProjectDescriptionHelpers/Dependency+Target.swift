import ProjectDescription

// swiftlint: disable all
public extension TargetDependency {
    struct Feature {}
    struct Domain {}
    struct Core {}
    struct Shared {}
}

public extension TargetDependency.Feature {
    static let RootFeature = TargetDependency.project(
        target: ModulePaths.Feature.RootFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.RootFeature.rawValue)
    )
    static let InputLanguageInfoFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.InputLanguageInfoFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.InputLanguageInfoFeature.rawValue)
    )
    static let InputLanguageInfoFeature = TargetDependency.project(
        target: ModulePaths.Feature.InputLanguageInfoFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.InputLanguageInfoFeature.rawValue)
    )
    static let InputCertificateInfoFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.InputCertificateInfoFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.InputCertificateInfoFeature.rawValue)
    )
    static let InputCertificateInfoFeature = TargetDependency.project(
        target: ModulePaths.Feature.InputCertificateInfoFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.InputCertificateInfoFeature.rawValue)
    )
    static let InputMilitaryInfoFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.InputMilitaryInfoFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.InputMilitaryInfoFeature.rawValue)
    )
    static let InputMilitaryInfoFeature = TargetDependency.project(
        target: ModulePaths.Feature.InputMilitaryInfoFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.InputMilitaryInfoFeature.rawValue)
    )
    static let InputWorkInfoFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.InputWorkInfoFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.InputWorkInfoFeature.rawValue)
    )
    static let InputWorkInfoFeature = TargetDependency.project(
        target: ModulePaths.Feature.InputWorkInfoFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.InputWorkInfoFeature.rawValue)
    )
    static let InputSchoolLifeInfoFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.InputSchoolLifeInfoFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.InputSchoolLifeInfoFeature.rawValue)
    )
    static let InputSchoolLifeInfoFeature = TargetDependency.project(
        target: ModulePaths.Feature.InputSchoolLifeInfoFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.InputSchoolLifeInfoFeature.rawValue)
    )
    static let InputProfileInfoFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.InputProfileInfoFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.InputProfileInfoFeature.rawValue)
    )
    static let InputProfileInfoFeature = TargetDependency.project(
        target: ModulePaths.Feature.InputProfileInfoFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.InputProfileInfoFeature.rawValue)
    )
    static let InputInformationFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.InputInformationFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.InputInformationFeature.rawValue)
    )
    static let InputInformationFeature = TargetDependency.project(
        target: ModulePaths.Feature.InputInformationFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.InputInformationFeature.rawValue)
    )
    static let SigninFeatureInterface = TargetDependency.project(
        target: ModulePaths.Feature.SigninFeature.targetName(type: .interface),
        path: .relativeToFeature(ModulePaths.Feature.SigninFeature.rawValue)
    )
    static let SigninFeature = TargetDependency.project(
        target: ModulePaths.Feature.SigninFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.SigninFeature.rawValue)
    )
    static let BaseFeature = TargetDependency.project(
        target: ModulePaths.Feature.BaseFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.BaseFeature.rawValue)
    )
}

public extension TargetDependency.Domain {
    static let StudentDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.StudentDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.StudentDomain.rawValue)
    )
    static let StudentDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.StudentDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.StudentDomain.rawValue)
    )
    static let StudentDomain = TargetDependency.project(
        target: ModulePaths.Domain.StudentDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.StudentDomain.rawValue)
    )
    static let AuthDomainTesting = TargetDependency.project(
        target: ModulePaths.Domain.AuthDomain.targetName(type: .testing),
        path: .relativeToDomain(ModulePaths.Domain.AuthDomain.rawValue)
    )
    static let AuthDomainInterface = TargetDependency.project(
        target: ModulePaths.Domain.AuthDomain.targetName(type: .interface),
        path: .relativeToDomain(ModulePaths.Domain.AuthDomain.rawValue)
    )
    static let AuthDomain = TargetDependency.project(
        target: ModulePaths.Domain.AuthDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.AuthDomain.rawValue)
    )
    static let BaseDomain = TargetDependency.project(
        target: ModulePaths.Domain.BaseDomain.targetName(type: .sources),
        path: .relativeToDomain(ModulePaths.Domain.BaseDomain.rawValue)
    )
}

public extension TargetDependency.Core {
    static let JwtStoreTesting = TargetDependency.project(
        target: ModulePaths.Core.JwtStore.targetName(type: .testing),
        path: .relativeToCore(ModulePaths.Core.JwtStore.rawValue)
    )
    static let JwtStoreInterface = TargetDependency.project(
        target: ModulePaths.Core.JwtStore.targetName(type: .interface),
        path: .relativeToCore(ModulePaths.Core.JwtStore.rawValue)
    )
    static let JwtStore = TargetDependency.project(
        target: ModulePaths.Core.JwtStore.targetName(type: .sources),
        path: .relativeToCore(ModulePaths.Core.JwtStore.rawValue)
    )
    static let DesignSystem = TargetDependency.project(
        target: ModulePaths.Core.DesignSystem.targetName(type: .sources),
        path: .relativeToCore(ModulePaths.Core.DesignSystem.rawValue)
    )
}

public extension TargetDependency.Shared {
    static let FoundationUtil = TargetDependency.project(
        target: ModulePaths.Shared.FoundationUtil.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.FoundationUtil.rawValue)
    )
    static let ViewUtil = TargetDependency.project(
        target: ModulePaths.Shared.ViewUtil.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.ViewUtil.rawValue)
    )
    static let DateUtil = TargetDependency.project(
        target: ModulePaths.Shared.DateUtil.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.DateUtil.rawValue)
    )
    static let KeychainModuleTesting = TargetDependency.project(
        target: ModulePaths.Shared.KeychainModule.targetName(type: .testing),
        path: .relativeToShared(ModulePaths.Shared.KeychainModule.rawValue)
    )
    static let KeychainModuleInterface = TargetDependency.project(
        target: ModulePaths.Shared.KeychainModule.targetName(type: .interface),
        path: .relativeToShared(ModulePaths.Shared.KeychainModule.rawValue)
    )
    static let KeychainModule = TargetDependency.project(
        target: ModulePaths.Shared.KeychainModule.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.KeychainModule.rawValue)
    )
    static let UtilityModule = TargetDependency.project(
        target: ModulePaths.Shared.UtilityModule.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.UtilityModule.rawValue)
    )
    static let GlobalThirdPartyLibrary = TargetDependency.project(
        target: ModulePaths.Shared.GlobalThirdPartyLibrary.targetName(type: .sources),
        path: .relativeToShared(ModulePaths.Shared.GlobalThirdPartyLibrary.rawValue)
    )
}
