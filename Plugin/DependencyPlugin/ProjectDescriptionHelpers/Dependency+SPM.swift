import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let TagLayoutView = TargetDependency.external(name: "TagLayoutView")
    static let NukeUI = TargetDependency.external(name: "NukeUI")
    static let Needle = TargetDependency.external(name: "NeedleFoundation")
    static let GAuthSignin = TargetDependency.external(name: "GAuthSignin")
    static let Nimble = TargetDependency.external(name: "Nimble")
    static let Quick = TargetDependency.external(name: "Quick")
    static let Emdpoint = TargetDependency.external(name: "Emdpoint")
}

public extension Package {
}
