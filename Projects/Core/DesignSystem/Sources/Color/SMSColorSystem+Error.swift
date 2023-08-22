import SwiftUI

public extension Color.SMSColorSystem {
    // swiftlint:disable identifier_name
    enum Error: SMSColorable {
        case e1
        case e2
        case e3
    }
}

public extension Color.SMSColorSystem.Error {
    var color: Color {
        switch self {
        case .e1: return DesignSystemAsset.Error.e1.swiftUIColor
        case .e2: return DesignSystemAsset.Error.e2.swiftUIColor
        case .e3: return DesignSystemAsset.Error.e3.swiftUIColor
        }
    }
}
