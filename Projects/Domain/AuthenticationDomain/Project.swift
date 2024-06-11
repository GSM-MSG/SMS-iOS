import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Domain.AuthenticationDomain.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing],
    internalDependencies: [
        .Domain.BaseDomain
    ]
)
