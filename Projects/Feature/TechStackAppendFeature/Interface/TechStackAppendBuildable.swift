import SwiftUI

public protocol TechStackAppendBuildable {
    associatedtype ViewType: View
    func makeView(completion: @escaping ([String]) -> Void) -> ViewType
}
