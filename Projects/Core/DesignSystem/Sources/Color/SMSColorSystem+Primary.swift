import UIKit

public extension UIColor.SMSColorSystem {
    // swiftlint:disable identifier_name
    enum Primary: SMSColorable {
        case p1
        case p2
        case p3
    }
}

public extension UIColor.SMSColorSystem.Primary {
    var color: UIColor {
        switch self {
        case .p1: return DesignSystemAsset.Primary.p1.color
        case .p2: return DesignSystemAsset.Primary.p2.color
        case .p3: return DesignSystemAsset.Primary.p3.color
        }
    }
}
