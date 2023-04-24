import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Core.Needle.rawValue,
    product: .staticLibrary,
    targets: [.interface],
    externalDependencies: [
        .SPM.Needle
    ]
)
