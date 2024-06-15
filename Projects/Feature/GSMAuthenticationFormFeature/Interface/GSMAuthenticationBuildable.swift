import SwiftUI

public protocol GSMAuthenticationBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
