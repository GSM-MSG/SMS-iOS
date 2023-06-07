import SwiftUI

public protocol TechStackAppendBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
