import SwiftUI

struct SMSChipButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background {
                configuration.isPressed ? Color.sms(.neutral(.n10)) : .sms(.system(.white))
            }
            .cornerRadius(8)
    }
}
