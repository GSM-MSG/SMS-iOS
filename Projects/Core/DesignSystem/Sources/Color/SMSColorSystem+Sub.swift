import UIKit

public extension UIColor.SMSColorSystem {
    // swiftlint: disable identifier_name
    enum Sub: SMSColorable {
        case s1
        case s2
        case s3
    }
}

public extension UIColor.SMSColorSystem.Sub {
    var color: UIColor {
        switch self {
        case .s1: return DesignSystemAsset.Sub.s1.color
        case .s2: return DesignSystemAsset.Sub.s2.color
        case .s3: return DesignSystemAsset.Sub.s3.color
        }
    }
}
