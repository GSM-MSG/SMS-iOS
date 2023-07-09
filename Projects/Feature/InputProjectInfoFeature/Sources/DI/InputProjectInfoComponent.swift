import InputProjectInfoFeatureInterface
import NeedleFoundation
import SwiftUI

protocol InputProjectInfoDependency: Dependency {}

final class InputProjectInfoComponent:
    Component<InputProjectInfoDependency>,
    InputProjectInfoBuildable {
    func makeView() -> some View {
        EmptyView()
    }
}
