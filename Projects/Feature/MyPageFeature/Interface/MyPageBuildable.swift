import SwiftUI

public protocol MyPageBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
