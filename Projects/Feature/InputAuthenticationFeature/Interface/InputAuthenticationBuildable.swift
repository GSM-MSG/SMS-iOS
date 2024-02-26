import SwiftUI

public protocol InputAuthenticationBuildable {
    associatedtype ViewType: View
    func makeView(delegate: InputAuthenticationDelegate) -> ViewType
}
