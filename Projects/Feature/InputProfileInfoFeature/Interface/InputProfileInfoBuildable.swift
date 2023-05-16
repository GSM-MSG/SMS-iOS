import SwiftUI

public protocol InputProfileInfoBuildable {
    associatedtype ViewType: View
    func makeView(delegate: InputProfileDelegate) -> ViewType
}
