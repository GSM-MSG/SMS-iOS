import ProjectDescriptionHelpers
import ProjectDescription
import DependencyPlugin
import EnvironmentPlugin
import Foundation

let configurations: [Configuration] = generateEnvironment == .ci ?
[
  .debug(name: .dev),
  .debug(name: .stage),
  .release(name: .prod)
] :
[
  .debug(name: .dev, xcconfig: .relativeToXCConfig(type: .dev, name: "App")),
  .debug(name: .stage, xcconfig: .relativeToXCConfig(type: .stage, name: "App")),
  .release(name: .prod, xcconfig: .relativeToXCConfig(type: .prod, name: "App"))
]

let settings: Settings =
    .settings(base: env.baseSetting,
              configurations: configurations,
              defaultSettings: .recommended)

let scripts: [TargetScript] = generateEnvironment == .dev ? [.needle, .swiftLint] : []

let targets: [Target] = [
    .init(
        name: env.name,
        platform: env.platform,
        product: .app,
        bundleId: "\(env.organizationName).\(env.name)-iOS",
        deploymentTarget: env.deploymentTarget,
        infoPlist: .file(path: "Support/Info.plist"),
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        scripts: scripts,
        dependencies: [
            .Feature.RootFeature,
            .Feature.SigninFeature,
            .Feature.InputInformationFeature,
            .Feature.InputProfileInfoFeature,
            .Feature.InputPrizeInfoFeature,
            .Feature.InputSchoolLifeInfoFeature,
            .Feature.InputWorkInfoFeature,
            .Feature.InputMilitaryInfoFeature,
            .Feature.InputCertificateInfoFeature,
            .Feature.InputLanguageInfoFeature,
            .Feature.InputProjectInfoFeature,
            .Feature.InputTeacherInfoFeature,
            .Feature.MainFeature,
            .Feature.SplashFeature,
            .Feature.TechStackAppendFeature,
            .Feature.StudentDetailFeature,
            .Feature.FilterFeature,
            .Feature.MyPageFeature,
            .Domain.AuthDomain,
            .Domain.StudentDomain,
            .Domain.FileDomain,
            .Domain.MajorDomain,
            .Domain.UserDomain,
            .Domain.TechStackDomain,
            .Domain.TeacherDomain,
            .Core.JwtStore,
            .Shared.KeychainModule
        ],
        settings: .settings(base: env.baseSetting)
    )
]

let schemes: [Scheme] = [
    .init(
        name: "\(env.name)-DEV",
        shared: true,
        buildAction: .buildAction(targets: ["\(env.name)"]),
        runAction: .runAction(configuration: .dev),
        archiveAction: .archiveAction(configuration: .dev),
        profileAction: .profileAction(configuration: .dev),
        analyzeAction: .analyzeAction(configuration: .dev)
    ),
    .init(
        name: "\(env.name)-STAGE",
        shared: true,
        buildAction: .buildAction(targets: ["\(env.name)"]),
        runAction: .runAction(configuration: .stage),
        archiveAction: .archiveAction(configuration: .stage),
        profileAction: .profileAction(configuration: .stage),
        analyzeAction: .analyzeAction(configuration: .stage)
    ),
    .init(
        name: "\(env.name)-PROD",
        shared: true,
        buildAction: .buildAction(targets: ["\(env.name)"]),
        runAction: .runAction(configuration: .prod),
        archiveAction: .archiveAction(configuration: .prod),
        profileAction: .profileAction(configuration: .prod),
        analyzeAction: .analyzeAction(configuration: .prod)
    )
]

let project = Project(
    name: env.name,
    organizationName: env.organizationName,
    settings: settings,
    targets: targets,
    schemes: schemes
)
