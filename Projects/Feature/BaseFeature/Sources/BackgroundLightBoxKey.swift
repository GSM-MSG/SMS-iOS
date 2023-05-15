import SwiftUI

public struct BackgroundLightBoxKey: EnvironmentKey {
    public static var defaultValue: Binding<Bool> = .constant(false)
}

public extension EnvironmentValues {
    var backgroundLightBox: Binding<Bool> {
        get { self[BackgroundLightBoxKey.self] }
        set { self[BackgroundLightBoxKey.self] = newValue }
    }
}
