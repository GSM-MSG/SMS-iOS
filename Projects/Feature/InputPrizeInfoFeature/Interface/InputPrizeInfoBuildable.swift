import SwiftUI

public protocol InputPrizeInfoBuildable {
    associatedtype ViewType: View
    func makeView(delegate: InputPrizeDelegate) -> ViewType
}
