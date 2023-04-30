import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.SigninFeature.rawValue,
    product: .framework,
    targets: [.interface, .unitTest],
    externalDependencies: [
        .SPM.GAuthSignin,
        .SPM.Needle
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
