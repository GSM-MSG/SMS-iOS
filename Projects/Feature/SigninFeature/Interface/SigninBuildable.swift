import SwiftUI

public protocol SigninBuildable {
    associatedtype ViewType: View
    func makeView(delegate: any SigninDelegate) -> ViewType
}
