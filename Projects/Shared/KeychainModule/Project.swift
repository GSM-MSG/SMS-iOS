import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Shared.KeychainModule.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing]
)
