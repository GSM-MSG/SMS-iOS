import SwiftUI

public extension Color.SMSColorSystem {
    // swiftlint:disable identifier_name
    enum Sub: SMSColorable {
        case s1
        case s2
        case s3
    }
}

public extension Color.SMSColorSystem.Sub {
    var color: Color {
        switch self {
        case .s1: return DesignSystemAsset.Sub.s1.swiftUIColor
        case .s2: return DesignSystemAsset.Sub.s2.swiftUIColor
        case .s3: return DesignSystemAsset.Sub.s3.swiftUIColor
        }
    }
}
