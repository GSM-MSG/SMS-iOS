import SwiftUI

public protocol InputSchoolLifeInfoBuildable {
    associatedtype ViewType: View
    func makeView(delegate: any InputSchoolLifeDelegate) -> ViewType
}
