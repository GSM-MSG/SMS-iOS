import SwiftUI

public protocol MyPageBuildable {
    associatedtype ViewType: View
    func makeView(delegate: any MyPageDelegate) -> ViewType
}
