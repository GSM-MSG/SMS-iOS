import SwiftUI

internal struct PressedSelectionButtonStyle: ButtonStyle {
    var isSeleted: Bool

    init(isSeleted: Bool) {
        self.isSeleted = isSeleted
    }

    @ViewBuilder
    func makeBody(configuration: Configuration) -> some View {
        Circle()
            .fill(self.isSeleted && configuration.isPressed ? Color.sms(.neutral(.n20)) : Color.clear)
            .overlay {
                configuration.label
            }
            .frame(width: 32, height: 32)
    }
}
