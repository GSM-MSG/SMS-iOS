import SwiftUI

public protocol StudentDetailBuildable {
    associatedtype ViewType: View
    func makeView(userID: String, with profileImageNamespace: Namespace.ID) -> ViewType
}
