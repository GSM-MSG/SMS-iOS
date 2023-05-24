import SwiftUI

public protocol InputCertificateInfoBuildable {
    associatedtype ViewType: View
    func makeView(delegate: InputCertificateDelegate) -> ViewType
}
