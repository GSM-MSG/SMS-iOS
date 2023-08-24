import SwiftUI
import UIKit

private struct UIScreenSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        return screen.screen.bounds.size
    }()
}

public extension EnvironmentValues {
    var screenSize: CGSize {
        get { self[UIScreenSizeKey.self] }
        set { self[UIScreenSizeKey.self] = newValue }
    }
}
