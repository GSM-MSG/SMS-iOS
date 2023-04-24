import SwiftUI

public protocol SigninComponentProtocol {
    associatedtype ViewType = View
    func makeView() -> ViewType
}
