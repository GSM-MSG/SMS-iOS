import BaseFeature
import InputWorkInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputWorkInfoDependency: Dependency {}

public final class InputWorkInfoComponent:
    Component<InputWorkInfoDependency>,
    InputWorkInfoBuildable {

    public func makeView() -> some View {
        EmptyView()
    }
}
