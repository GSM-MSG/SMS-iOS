import SwiftUI

private struct UIScreenSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

public extension EnvironmentValues {
    var screenSize: CGSize {
        get { self[UIScreenSizeKey.self] }
        set { self[UIScreenSizeKey.self] = newValue }
    }
}
