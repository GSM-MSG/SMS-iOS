import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.GSMAuthenticationFormFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest, .demo],
    internalDependencies: [
        .Feature.BaseFeature,
        .Domain.AuthenticationDomainInterface,
        .Domain.FileDomainInterface
    ],
    demoDependencies: [
        .Domain.AuthenticationDomainTesting,
        .Domain.FileDomainTesting
    ]
)
