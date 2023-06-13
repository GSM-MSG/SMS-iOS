import SwiftUI

public protocol SplashBuildable {
    associatedtype ViewType: View
    func makeView(delegate: SplashDelegate) -> ViewType
}
