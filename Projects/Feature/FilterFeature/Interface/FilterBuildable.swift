import SwiftUI

public protocol FilterBuildable {
    associatedtype ViewType: View
    func makeView(delegate: FilterDelegate) -> ViewType
}
