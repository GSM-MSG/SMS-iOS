import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.MainFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.StudentDetailFeatureInterface,
        .Feature.FilterFeatureInterface,
        .Domain.StudentDomainInterface,
        .Domain.AuthDomainInterface,
        .Domain.UserDomainInterface
    ]
)
