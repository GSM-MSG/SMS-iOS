import ProjectDescription

public extension TargetScript {
    static let swiftLint = TargetScript.pre(
        path: Path.relativeToRoot("Scripts/SwiftLintRunScript.sh"),
        name: "SwiftLint",
        basedOnDependencyAnalysis: false
    )
    static let needle = TargetScript.pre(
        path: .relativeToRoot("Scripts/NeedleRunScript.sh"),
        name: "Needle",
        basedOnDependencyAnalysis: false
    )
    static let apolloGraphQL = TargetScript.pre(
        path: .relativeToRoot("Scripts/GenerateApolloGraphQLAPI.sh"),
        name: "Apollo Graph QL",
        basedOnDependencyAnalysis: false
    )
}
