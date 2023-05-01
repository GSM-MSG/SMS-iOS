import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.SigninFeature.rawValue,
    product: .staticFramework,
    targets: [.interface, .unitTest],
    externalDependencies: [
        .SPM.GAuthSignin
    ],
    internalDependencies: [
        .Domain.AuthDomainInterface,
        .Feature.BaseFeature
    ],
    additionalPlistRows: [
        "CLIENT_ID": .string("$(CLIENT_ID)"),
        "REDIREDCT_URI": .string("$(REDIREDCT_URI)")
    ]
)
