import SwiftUI

public struct SMSSelectionControls: View {
    @Binding var isOn: Bool
    @Environment(\.isEnabled) private var isEnabled: Bool

    public init(isOn: Binding<Bool>) {
        _isOn = isOn
    }

    public var body: some View {
        Button {
            self.isOn.toggle()
        } label: {
            ZStack {
                Group {
                    Circle()
                        .stroke(isOn ? Color.sms(.primary(.p2)) : Color.sms(.neutral(.n20)), lineWidth: 2)
                        .frame(width: 20, height: 20)

                    Circle()
                        .fill(isOn ? Color.sms(.primary(.p2)) : .clear)
                        .frame(width: 12, height: 12)
                }
                .opacity(isEnabled ? 1.0 : 0.5)
            }
        }
    }
}
