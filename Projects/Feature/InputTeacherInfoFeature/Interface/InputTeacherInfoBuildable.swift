import SwiftUI

public protocol InputTeacherInfoBuildable {
    associatedtype ViewType: View
    func makeView(delegate: InputTeacherDelegate) -> ViewType
}
