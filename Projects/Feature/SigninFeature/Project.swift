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
    ]
)
