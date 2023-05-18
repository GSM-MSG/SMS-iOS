import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    product: .framework,
    targets: [.unitTest],
    externalDependencies: [
        .SPM.Needle
    ],
    internalDependencies: [
        .Core.DesignSystem,
        .Shared.DateUtil,
        .Shared.FoundationUtil,
        .Shared.GlobalThirdPartyLibrary,
        .Shared.UtilityModule
    ]
)
