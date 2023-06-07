import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.TechStackAppendFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest, .demo],
    internalDependencies: [
        .feature(target: .BaseFeature)
    ]
)
