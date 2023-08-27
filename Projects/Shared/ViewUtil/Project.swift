import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.ViewUtil.rawValue,
    product: .staticLibrary,
    targets: [],
    internalDependencies: [
        .Shared.FoundationUtil
    ]
)
