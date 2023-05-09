import SwiftUI

public struct SMSSelectionControls: View {
    @Binding var isOn: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Button {
            self.isOn.toggle()
        } label: {
            ZStack {
                Circle()
                    .stroke(isOn ? Color.sms(.primary(.p2)) : Color.sms(.neutral(.n20)), lineWidth: 2)
                    .frame(width: 20, height: 20)

                Circle()
                    .fill(isOn ? Color.sms(.primary(.p2)) : .clear)
                    .frame(width: 12, height: 12)
            }
        }
        .buttonStyle(CustomButtonStyle())
    }

}

private struct CustomButtonStyle: ButtonStyle {
    @ViewBuilder
    func makeBody(configuration: Configuration) -> some View {
        Circle()
            .fill(configuration.isPressed ? Color.sms(.neutral(.n20)) : Color.clear)
            .overlay {
                configuration.label
            }
            .frame(width: 32, height: 32)
    }
}
