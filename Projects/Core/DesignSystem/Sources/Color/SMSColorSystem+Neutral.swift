import UIKit

public extension UIColor.SMSColorSystem {
    enum Neutral: SMSColorable {
        case n10
        case n20
        case n30
        case n40
        case n50
    }
}

public extension UIColor.SMSColorSystem.Neutral {
    var color: UIColor {
        switch self {
        case .n10: return DesignSystemAsset.Neutral.n10.color
        case .n20: return DesignSystemAsset.Neutral.n20.color
        case .n30: return DesignSystemAsset.Neutral.n30.color
        case .n40: return DesignSystemAsset.Neutral.n40.color
        case .n50: return DesignSystemAsset.Neutral.n50.color
        }
    }
}
