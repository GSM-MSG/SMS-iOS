import NeedleFoundation

public protocol JwtStoreBuildable {
    var jwtStore: any JwtStore { get }
}
