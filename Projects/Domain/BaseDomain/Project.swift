import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.BaseDomain.rawValue,
    product: .framework,
    targets: [.unitTest],
    externalDependencies: [
        .SPM.Emdpoint
    ],
    internalDependencies: [
        .Core.JwtStoreInterface,
        .Shared.GlobalThirdPartyLibrary,
        .Shared.DateUtil,
        .Shared.FoundationUtil,
        .Shared.UtilityModule,
        .Shared.ConcurrencyUtil
    ],
    additionalPlistRows: [
        "BASE_URL": .string("$(BASE_URL)")
    ]
)
