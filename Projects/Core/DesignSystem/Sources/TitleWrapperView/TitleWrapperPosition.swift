import SwiftUI

public enum TitlePosition {
    case top(_ alignment: HorizontalPosition)
    case bottom(_ alignment: HorizontalPosition)

    public enum HorizontalPosition {
        case leading
        case center
        case trailing
    }
}

public extension TitlePosition.HorizontalPosition {
    var toSUI: HorizontalAlignment {
        switch self {
        case .leading: return .leading
        case .center: return .center
        case .trailing: return .trailing
        }
    }

}
