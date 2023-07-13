import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Core.DesignSystem.rawValue,
    product: .framework,
    targets: [.demo],
    externalDependencies: [
        .SPM.TagLayoutView,
        .SPM.Lottie
    ],
    internalDependencies: [
        .Shared.ViewUtil,
        .Shared.DateUtil
    ],
    resources: ["Resources/**"],
    resourceSynthesizers: .default + [
        .custom(name: "Lottie", parser: .json, extensions: ["json"])
    ]
)
