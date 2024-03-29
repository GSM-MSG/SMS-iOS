import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.InputInformationFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.BaseFeature,
        .Feature.InputProfileInfoFeatureInterface,
        .Feature.InputSchoolLifeInfoFeatureInterface,
        .Feature.InputWorkInfoFeatureInterface,
        .Feature.InputMilitaryInfoFeatureInterface,
        .Feature.InputCertificateInfoFeatureInterface,
        .Feature.InputLanguageInfoFeatureInterface,
        .Feature.InputProjectInfoFeatureInterface,
        .Feature.InputPrizeInfoFeatureInterface,
        .Domain.FileDomainInterface,
        .Domain.StudentDomainInterface,
        .Domain.UserDomainInterface
    ]
)
