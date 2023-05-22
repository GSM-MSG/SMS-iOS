import SwiftUI

public struct SMSSelectionControls: View {
    @Binding var isSeleted: Bool

    public init(isSeleted: Binding<Bool>) {
        _isSeleted = isSeleted
    }
    public var body: some View {
        Button {
            self.isSeleted.toggle()
        } label: {
            ZStack {
                Circle()
                    .stroke(isSeleted ? Color.sms(.primary(.p2)) : Color.sms(.neutral(.n20)), lineWidth: 2)
                    .frame(width: 20, height: 20)
                Circle()
                    .fill(isSeleted ? Color.sms(.primary(.p2)) : .clear)
                    .frame(width: 12, height: 12)
            }
        }
        .buttonStyle(CustomButtonStyle(isSeleted: isSeleted))
    }
}

private struct CustomButtonStyle: ButtonStyle {
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
