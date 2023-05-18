import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.StudentDomain.rawValue,
    product: .staticLibrary,
    targets: [.demo, .interface, .testing, .unitTest],
    internalDependencies: [
        .Domain.BaseDomain
    ]
)
