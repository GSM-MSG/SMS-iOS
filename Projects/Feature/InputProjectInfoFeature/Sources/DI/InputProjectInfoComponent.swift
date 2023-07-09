import SwiftUI
import NeedleFoundation

protocol InputProjectInfoDependency: Dependency {}

final class InputProjectInfoComponent:
    Component<InputProjectInfoDependency>,
    InputProjectInfoBuildable {
    func makeView() -> some View {
        EmptyView()
    }
}
