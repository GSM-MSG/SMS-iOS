import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.FoundationUtil.rawValue,
    product: .framework,
    targets: [.unitTest],
    internalDependencies: []
)
