import SwiftUI
import ViewUtil

@available(*, unavailable, renamed: "SMSRadioButton")
public typealias SMSSelectionControls = SMSRadioButton

public struct SMSRadioButton: View {
    @Binding var isSelected: Bool

    public init(isSelected: Binding<Bool>) {
        _isSelected = isSelected
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(isSelected ? Color.sms(.primary(.p2)) : Color.sms(.neutral(.n20)), lineWidth: 2)
                .frame(width: 20, height: 20)

            Circle()
                .fill(isSelected ? Color.sms(.primary(.p2)) : .clear)
                .frame(width: 12, height: 12)
        }
        .buttonWrapper {
            self.isSelected.toggle()
        }
        .buttonStyle(PressedSelectionButtonStyle(isSelected: isSelected))
    }
}
