import SwiftUI

public extension Color.SMSColorSystem {
    // swiftlint:disable identifier_name
    enum Primary: SMSColorable {
        case p1
        case p2
        case p3
    }
}

public extension Color.SMSColorSystem.Primary {
    var color: Color {
        switch self {
        case .p1: return DesignSystemAsset.Primary.p1.swiftUIColor
        case .p2: return DesignSystemAsset.Primary.p2.swiftUIColor
        case .p3: return DesignSystemAsset.Primary.p3.swiftUIColor
        }
    }
}
