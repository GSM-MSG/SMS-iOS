import SwiftUI

public protocol InputInformationBuildable {
    associatedtype ViewType: View
    func makeView(delegate: any InputInformationDelegate) -> ViewType
}
