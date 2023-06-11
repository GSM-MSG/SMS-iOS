import SwiftUI

public protocol StudentDetailBuildable {
    associatedtype ViewType: View
    func makeView(with profileImageNamespace: Namespace.ID) -> ViewType
}
