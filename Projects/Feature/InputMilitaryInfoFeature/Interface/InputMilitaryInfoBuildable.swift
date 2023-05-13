import SwiftUI

public protocol InputMilitaryInfoBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
