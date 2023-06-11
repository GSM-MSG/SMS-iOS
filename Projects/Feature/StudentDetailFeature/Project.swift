import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.StudentDetailFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest, .demo],
    internalDependencies: [
        .Feature.BaseFeature,
        .Domain.StudentDomainInterface,
        .Domain.UserDomainInterface
    ],
    demoDependencies: [
        .Domain.UserDomainTesting
    ]
)
