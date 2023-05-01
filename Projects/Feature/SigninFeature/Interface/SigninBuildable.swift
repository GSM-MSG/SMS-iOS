import SwiftUI

public protocol SigninBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
