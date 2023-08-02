import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.InputProjectInfoFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest, .demo],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.InputInformationBaseFeature,
        .Feature.TechStackAppendFeatureInterface,
        .Feature.InputPrizeInfoFeatureInterface,
        .Domain.StudentDomainInterface,
        .Domain.FileDomainInterface,
        .Domain.FileDomainTesting,
        .Shared.DateUtil
    ]
)
