import SwiftUI

public protocol InputProjectInfoBuildable {
    associatedtype ViewType: View
    func makeView(delegate: any InputProjectInfoDelegate) -> ViewType
}
