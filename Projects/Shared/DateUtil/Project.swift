import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.DateUtil.rawValue,
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: []
)
