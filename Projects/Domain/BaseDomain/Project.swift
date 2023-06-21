import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    product: .framework,
    targets: [.unitTest],
    externalDependencies: [
        .SPM.Emdpoint,
        .SPM.Apollo
    ],
    internalDependencies: [
        .Core.JwtStoreInterface,
        .Shared.GlobalThirdPartyLibrary,
        .Shared.DateUtil,
        .Shared.FoundationUtil,
        .Shared.UtilityModule
    ],
    additionalPlistRows: [
        "BASE_URL": .string("$(BASE_URL)")
    ]
)
