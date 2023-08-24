import SwiftUI

public extension Color.SMSColorSystem {
    enum System: SMSColorable {
        case positive
        case black
        case white
    }
}

public extension Color.SMSColorSystem.System {
    var color: Color {
        switch self {
        case .positive: return DesignSystemAsset.System.positive.swiftUIColor
        case .black: return DesignSystemAsset.System.black.swiftUIColor
        case .white: return DesignSystemAsset.System.white.swiftUIColor
        }
    }
}
