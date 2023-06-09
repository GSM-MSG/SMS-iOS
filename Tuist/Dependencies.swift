import ProjectDescription
import ConfigurationPlugin

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/uber/needle", requirement: .exact("0.22.0")),
            .remote(url: "https://github.com/GSM-MSG/GAuthSignin-Swift", requirement: .exact("0.0.3")),
            .remote(url: "https://github.com/Quick/Nimble.git", requirement: .exact("11.2.2")),
            .remote(url: "https://github.com/Quick/Quick.git", requirement: .exact("6.1.0")),
            .remote(url: "https://github.com/GSM-MSG/Emdpoint.git", requirement: .exact("3.2.8")),
    
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
