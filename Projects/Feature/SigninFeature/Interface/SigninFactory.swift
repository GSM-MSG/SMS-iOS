import SwiftUI

public protocol SiginFactory {
    associatedtype ViewType = View
    func makeView() -> ViewType
}
