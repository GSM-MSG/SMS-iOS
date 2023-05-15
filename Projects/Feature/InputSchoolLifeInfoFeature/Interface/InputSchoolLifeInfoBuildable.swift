import SwiftUI

public protocol InputSchoolListInfoBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
