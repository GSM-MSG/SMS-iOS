import BaseFeature
import InputSchoolLifeInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputSchoolLifeInfoDependency: Dependency {}

public final class InputSchoolLifeInfoComponent:
    Component<InputSchoolLifeInfoDependency>,
    InputSchoolListInfoBuildable {

    public func makeView() -> some View {
        EmptyView()
    }
}
