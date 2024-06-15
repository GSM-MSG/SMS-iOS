import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.MainFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .testing, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.StudentDetailFeatureInterface,
        .Feature.FilterFeatureInterface,
        .Feature.MyPageFeatureInterface,
        .Feature.GSMAuthenticationFormFeatureInterface,
        .Domain.StudentDomainInterface,
        .Domain.UserDomainInterface
    ]
)
