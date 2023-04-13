import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Emdpoint = TargetDependency.external(name: "Emdpoint")
}

public extension Package {
}
