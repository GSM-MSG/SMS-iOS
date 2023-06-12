import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Core.DesignSystem.rawValue,
    product: .framework,
    targets: [.demo],
    externalDependencies: [
        .SPM.TagLayoutView
    ],
    internalDependencies: [
        .Shared.ViewUtil,
    ],
    resources: ["Resources/**"]
)
