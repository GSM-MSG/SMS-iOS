import SwiftUI

public protocol InputProjectInfoBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
