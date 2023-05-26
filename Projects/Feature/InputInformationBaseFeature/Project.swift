import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.InputInformationBaseFeature.rawValue,
    product: .framework,
    targets: [],
    internalDependencies: [
        .Feature.BaseFeature
    ]
)
