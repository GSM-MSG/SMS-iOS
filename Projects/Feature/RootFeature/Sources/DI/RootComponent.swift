import NeedleFoundation
import SwiftUI
import SigninFeatureInterface
import InputInformationFeatureInterface

public protocol RootDependency: Dependency {
    var signinBuildable: any SigninBuildable { get }
    var inputInformationBuildable: any InputInformationBuildable { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        EmptyView()
    }
}
