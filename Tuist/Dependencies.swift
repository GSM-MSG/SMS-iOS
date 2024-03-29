import ProjectDescription
import ConfigurationPlugin

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/airbnb/lottie-ios.git", requirement: .exact("4.2.0")),
            .remote(url: "https://github.com/giiiita/TagLayoutView.git", requirement: .branch("master")),
            .remote(url: "https://github.com/kean/Nuke.git", requirement: .exact("12.1.0")),
            .remote(url: "https://github.com/uber/needle", requirement: .exact("0.22.0")),
            .remote(url: "https://github.com/GSM-MSG/GAuthSignin-Swift", requirement: .exact("0.0.3")),
            .remote(url: "https://github.com/Quick/Nimble.git", requirement: .exact("11.2.2")),
            .remote(url: "https://github.com/Quick/Quick.git", requirement: .exact("6.1.0")),
            .remote(url: "https://github.com/GSM-MSG/Emdpoint.git", requirement: .exact("3.5.0"))

        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: .dev),
                .debug(name: .stage),
                .release(name: .prod)
            ]
        )
    ),
    platforms: [.iOS]
)
