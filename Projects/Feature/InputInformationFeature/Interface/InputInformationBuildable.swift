import SwiftUI

public protocol InputInformationBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
