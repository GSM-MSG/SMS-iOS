import ProjectDescription

// swiftlint: disable all
public extension TargetDependency {
    struct Feature {}
    struct Domain {}
    struct Core {}
    struct Shared {}
}

public extension TargetDependency.Feature {
    static let BaseFeature = TargetDependency.project(
        target: ModulePaths.Feature.BaseFeature.targetName(type: .sources),
        path: .relativeToFeature(ModulePaths.Feature.BaseFeature.rawValue)
    )
}

public extension TargetDependency.Domain {
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
