import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.SigninFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    externalDependencies: [
        .SPM.GAuthSignin
    ],
    internalDependencies: [
        .Domain.AuthDomainInterface,
        .Feature.BaseFeature
    ]
)
