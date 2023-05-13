import SwiftUI

public protocol InputLanguageInfoBuildable {
    associatedtype ViewType: View
    func makeView() -> ViewType
}
