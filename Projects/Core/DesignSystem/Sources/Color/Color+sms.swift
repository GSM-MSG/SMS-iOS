import SwiftUI

public extension Color {
    enum SMSColorSystem {
        case primary(Primary)
        case sub(Sub)
        case neutral(Neutral)
        case system(System)
        case error(Error)
    }

    static func sms(_ style: SMSColorSystem) -> Color {
        switch style {
        case let .primary(colorable as SMSColorable),
            let .neutral(colorable as SMSColorable),
            let .system(colorable as SMSColorable),
            let .sub(colorable as SMSColorable),
            let .error(colorable as SMSColorable):
            return colorable.color
        }
    }
}
