import UIKit

public extension UIColor.SMSColorSystem {
    enum System: SMSColorable {
        case error
        case positive
        case black
        case white
    }
}

public extension UIColor.SMSColorSystem.System {
    var color: UIColor {
        switch self {
        case .error: return DesignSystemAsset.System.error.color
        case .positive: return DesignSystemAsset.System.positive.color
        case .black: return DesignSystemAsset.System.black.color
        case .white: return DesignSystemAsset.System.white.color
        }
    }
}
