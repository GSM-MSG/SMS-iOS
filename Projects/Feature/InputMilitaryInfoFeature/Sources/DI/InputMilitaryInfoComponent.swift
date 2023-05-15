import BaseFeature
import InputMilitaryInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputMilitaryInfoDependency: Dependency {}

public final class InputMilitaryInfoComponent:
    Component<InputMilitaryInfoDependency>,
    InputMilitaryInfoBuildable {

    public func makeView() -> some View {
        EmptyView()
    }
}
