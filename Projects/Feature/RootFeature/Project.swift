import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Feature.RootFeature.rawValue,
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Feature.SigninFeatureInterface,
        .Feature.InputInformationFeatureInterface,
        .Feature.MainFeatureInterface,
        .Feature.SplashFeatureInterface,
        .Feature.BaseFeature,
        .Feature.MyPageFeatureInterface
    ]
)
