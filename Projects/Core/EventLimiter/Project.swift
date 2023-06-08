import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Core.EventLimiter.rawValue,
    product: .framework,
    targets: [.unitTest],
    internalDependencies: []
)
