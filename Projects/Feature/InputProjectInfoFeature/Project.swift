import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.InputProjectInfoFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest, .demo],
    internalDependencies: [
        .Feature.InputInformationBaseFeature,
        .Feature.TechStackAppendFeatureInterface,
        .Feature.InputPrizeInfoFeatureInterface
    ]
)
