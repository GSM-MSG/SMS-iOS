import SwiftUI

public protocol TechStackAppendBuildable {
    associatedtype ViewType: View
    func makeView(initial techStacks: [String], completion: @escaping ([String]) -> Void) -> ViewType
}
