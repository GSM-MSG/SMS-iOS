import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.FilterFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.TechStackAppendFeatureInterface,
        .Domain.MajorDomainInterface,
        .Domain.UserDomainInterface,
        .Domain.StudentDomainInterface
    ],
    interfaceDependencies: [
        .Domain.StudentDomainInterface
    ]
)
