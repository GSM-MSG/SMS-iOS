import InputProfileInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputProfileInfoDependency: Dependency {}

public final class InputProfileInfoComponent:
    Component<InputProfileInfoDependency>,
    InputProfileInfoBuildable {

    public func makeView() -> some View {
        EmptyView()
    }
}
