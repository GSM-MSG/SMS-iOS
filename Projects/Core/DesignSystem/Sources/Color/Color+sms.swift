import SwiftUI

public extension Color {
    enum SMSColorSystem {
        case primary(Primary)
        case sub(Sub)
        case neutral(Neutral)
        case system(System)
    }

    static func sms(_ style: SMSColorSystem) -> Color {
        switch style {
        case let .primary(colorable as SMSColorable),
            let .neutral(colorable as SMSColorable),
            let .system(colorable as SMSColorable),
            let .sub(colorable as SMSColorable):
            return colorable.color
        }
    }
}
