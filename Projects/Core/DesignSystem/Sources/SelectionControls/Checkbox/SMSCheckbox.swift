import SwiftUI
import ViewUtil

public struct SMSCheckbox: View {
    @Binding var isSeleted: Bool

    public init(isSeleted: Binding<Bool>) {
        _isSeleted = isSeleted
    }

    public var body: some View {
        Button {
            self.isSeleted.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(isSeleted ? Color.sms(.primary(.p2)) : .clear)
                    .frame(width: 20, height: 20)
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(isSeleted ? Color.sms(.primary(.p2)) : Color.sms(.neutral(.n20)), lineWidth: 2)
                    }

                SMSIcon(.checkmark, width: 10, height: 8)
                    .foregroundColor(.sms(.system(.white)))
                    .conditional(isSeleted)
            }
            .animation(.default, value: isSeleted)
        }
        .buttonStyle(PressedSelectionButtonStyle(isSeleted: isSeleted))
    }
}
