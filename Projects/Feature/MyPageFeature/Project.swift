import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.MyPageFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest, .demo],
    internalDependencies: [
        .Feature.BaseFeature,
        .Domain.UserDomainInterface,
        .Domain.StudentDomainInterface,
        .Domain.AuthDomainInterface
    ],
    demoDependencies: [
        .Domain.UserDomainTesting,
        .Domain.AuthDomainTesting,
        .Domain.FileDomainTesting,
        .Domain.StudentDomainTesting,
        .Domain.MajorDomainTesting
    ]
)
