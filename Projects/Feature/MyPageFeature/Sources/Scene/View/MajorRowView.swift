import DesignSystem
import SwiftUI

struct MajorRowView: View {
    private var text: String
    @Binding private var isSeleted: Bool

    init(text: String, isSeleted: Binding<Bool>) {
        self.text = text
        _isSeleted = isSeleted
    }

    var body: some View {
        HStack {
            SMSText(text, font: .body1)

            Spacer()

            SMSRadioButton(isSelected: $isSeleted)
                .buttonWrapper {}
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
