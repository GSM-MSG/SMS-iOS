import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.InputProfileInfoFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.InputInformationBaseFeature,
        .Feature.TechStackAppendFeatureInterface,
        .Domain.MajorDomainInterface
    ],
    unitTestDependencies: [
        .Domain.MajorDomainTesting
    ]
)
