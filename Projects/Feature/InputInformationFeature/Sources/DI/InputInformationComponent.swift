import InputInformationFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputInformationDependency: Dependency {}

public final class InputInformationComponent:
    Component<InputInformationDependency>,
    InputInformationBuildable {

    public func makeView() -> some View {
        EmptyView()
    }
}
