import SwiftUI

@available(*, unavailable, renamed: "SMSRadioButton")
public typealias SMSSelectionControls = SMSRadioButton

public struct SMSRadioButton: View {
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
        .buttonStyle(PressedSelectionButtonStyle(isSeleted: isSeleted))
    }
}
