import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Needle = TargetDependency.external(name: "Needle")
    static let GAuthSignin = TargetDependency.external(name: "GAuthSignin")
    static let Nimble = TargetDependency.external(name: "Nimble")
    static let Quick = TargetDependency.external(name: "Quick")
    static let Emdpoint = TargetDependency.external(name: "Emdpoint")
}

public extension Package {
}
