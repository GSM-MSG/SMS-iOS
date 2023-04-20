import SwiftUI

public extension Color.SMSColorSystem {
    enum Neutral: SMSColorable {
        case n10
        case n20
        case n30
        case n40
        case n50
    }
}

public extension Color.SMSColorSystem.Neutral {
    var color: Color {
        switch self {
        case .n10: return DesignSystemAsset.Neutral.n10.swiftUIColor
        case .n20: return DesignSystemAsset.Neutral.n20.swiftUIColor
        case .n30: return DesignSystemAsset.Neutral.n30.swiftUIColor
        case .n40: return DesignSystemAsset.Neutral.n40.swiftUIColor
        case .n50: return DesignSystemAsset.Neutral.n50.swiftUIColor
        }
    }
}
