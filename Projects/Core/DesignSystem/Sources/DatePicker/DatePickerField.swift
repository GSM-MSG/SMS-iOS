import SwiftUI

public struct DatePickerField: View {
    let dateText: String
    let action: () -> Void

    public init(
        dateText: String,
        action: @escaping () -> Void
    ) {
        self.dateText = dateText
        self.action = action
    }

    public var body: some View {
        SMSTextField(
            "yyyy.mm",
            text: Binding(
                get: { dateText },
                set: { _ in }
            ),
            isOnClear: false
        )
        .disabled(true)
        .overlay(alignment: .trailing) {
            SMSIcon(.calendar)
                .padding(.trailing, 12)
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    action()
                }
        )
    }
}
