import SwiftUI

public protocol SigninFactory {
    associatedtype ViewType = View
    func makeView() -> ViewType
}
