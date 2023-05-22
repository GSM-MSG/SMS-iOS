import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.BaseFeature.rawValue,
    product: .framework,
    targets: [.unitTest],
    externalDependencies: [
        .SPM.Needle,
        .SPM.IQKeyboardManager
    ],
    internalDependencies: [
        .Core.DesignSystem,
        .Shared.DateUtil,
        .Shared.FoundationUtil,
        .Shared.GlobalThirdPartyLibrary,
        .Shared.Validator,
        .Shared.UtilityModule
    ]
)
