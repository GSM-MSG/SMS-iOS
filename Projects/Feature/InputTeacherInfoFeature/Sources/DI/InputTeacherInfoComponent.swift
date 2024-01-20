import BaseFeature
import InputTeacherInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputTeacherInfoDependency: Dependency {}

public final class InputTeacherInfoComponent: Component<InputTeacherInfoDependency>, InputTeacherInfoBuildable {

    public func makeView() -> some View {
        EmptyView()
    }
}
