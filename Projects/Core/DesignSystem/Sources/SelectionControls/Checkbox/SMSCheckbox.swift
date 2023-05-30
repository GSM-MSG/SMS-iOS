import SwiftUI
import ViewUtil

public struct SMSCheckbox: View {
    @Binding var isSelected: Bool

    public init(isSelected: Binding<Bool>) {
        self._isSelected = isSelected
    }

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(isSelected ? Color.sms(.primary(.p2)) : .clear)
                .frame(width: 20, height: 20)
                .roundedStroke(
                    cornerRadius: 4,
                    color: isSelected ? Color.sms(.primary(.p2)) : Color.sms(.neutral(.n20)),
                    lineWidth: 2
                )

            SMSIcon(.checkmark, width: 10, height: 8)
                .foregroundColor(.sms(.system(.white)))
                .conditional(isSelected)
        }
        .animation(.default, value: isSelected)
        .buttonWrapper {
            self.isSelected.toggle()
        }
        .buttonStyle(PressedSelectionButtonStyle(isSelected: isSelected))
    }
}
