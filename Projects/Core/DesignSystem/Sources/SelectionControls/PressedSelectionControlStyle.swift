import SwiftUI

internal struct PressedSelectionButtonStyle: ButtonStyle {
    var isSelected: Bool

    @ViewBuilder
    func makeBody(configuration: Configuration) -> some View {
        Circle()
            .fill(self.isSelected && configuration.isPressed ? Color.sms(.neutral(.n20)) : Color.clear)
            .overlay {
                configuration.label
            }
            .frame(width: 32, height: 32)
    }
}
