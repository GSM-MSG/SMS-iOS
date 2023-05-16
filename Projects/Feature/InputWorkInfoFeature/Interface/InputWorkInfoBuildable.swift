import SwiftUI

public protocol InputWorkInfoBuildable {
    associatedtype ViewType: View
    func makeView(delegate: InputWorkDelegate) -> ViewType
}
