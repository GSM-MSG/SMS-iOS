import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.InputInformationFeature.rawValue,
    product: .staticLibrary,
    targets: [.interface, .unitTest],
    internalDependencies: [
        .Feature.InputInformationBaseFeature
        .Feature.InputProfileInfoFeatureInterface,
        .Feature.InputSchoolLifeInfoFeatureInterface,
        .Feature.InputWorkInfoFeatureInterface,
        .Feature.InputMilitaryInfoFeatureInterface,
        .Feature.InputCertificateInfoFeatureInterface,
        .Feature.InputLanguageInfoFeatureInterface,
        .Domain.FileDomainInterface,
        .Domain.StudentDomainInterface
    ]
)
