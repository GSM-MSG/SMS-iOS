import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Core.Debouncer.rawValue,
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: []
)
