import BaseFeature
import InputCertificateInfoFeatureInterface
import NeedleFoundation
import SwiftUI

public protocol InputCertificateInfoDependency: Dependency {}

public final class InputCertificateInfoComponent:
    Component<InputCertificateInfoDependency>,
    InputCertificateInfoBuildable {

    public func makeView() -> some View {
        EmptyView()
    }
}
