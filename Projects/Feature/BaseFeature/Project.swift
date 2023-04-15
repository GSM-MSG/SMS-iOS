import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    product: .framework,
    targets: [.unitTest],
    internalDependencies: [
        .Core.DesignSystem,
        .Shared.DateUtil,
        .Shared.GlobalThirdPartyLibrary,
        .Shared.ViewUtil,
        .Shared.UtilityModule
    ]
)
