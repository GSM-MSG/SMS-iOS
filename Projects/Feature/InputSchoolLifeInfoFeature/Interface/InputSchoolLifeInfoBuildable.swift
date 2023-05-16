import SwiftUI

public protocol InputSchoolListInfoBuildable {
    associatedtype ViewType: View
    func makeView(delegate: any InputSchoolLifeDelegate) -> ViewType
}
