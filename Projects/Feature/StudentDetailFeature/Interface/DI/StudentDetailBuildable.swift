import SwiftUI

public protocol StudentDetailBuildable {
    associatedtype ViewType: View
    func makeView(userID: String) -> ViewType
}
