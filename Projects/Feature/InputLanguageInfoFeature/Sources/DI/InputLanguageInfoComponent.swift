import BaseFeature
import InputLanguageInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputLanguageInfoDependency: Dependency {}

public final class InputLanguageInfoComponent:
    Component<InputLanguageInfoDependency>,
    InputLanguageInfoBuildable {

    public func makeView() -> some View {
        EmptyView()
    }
}
