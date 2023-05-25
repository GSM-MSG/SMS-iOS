import SwiftUI

public struct SMSTextField: View {
    @Binding var text: String
    @FocusState var isFocused: Bool
    var placeholder: String
    var errorText: String
    var isError: Bool
    var isOnClear: Bool
    var onSubmit: () -> Void

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        errorText: String = "",
        isError: Bool = false,
        isOnClear: Bool = true,
        onSubmit: @escaping () -> Void = {}
    ) {
        self._text = text
        self.placeholder = placeholder
        self.errorText = errorText
        self.isError = isError
        self.isOnClear = isOnClear
        self.onSubmit = onSubmit
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TextField(placeholder, text: $text)
                .onSubmit(onSubmit)
                .smsFont(.body1, color: .neutral(.n50))
                .padding(.horizontal, 12)
                .padding(.vertical, 13.5)
                .focused($isFocused)
                .background(Color.sms(.neutral(.n10)))
                .cornerRadius(8)
                .overlay {
                    if isFocused {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.sms(.primary(.p2)))
                    }
                }
                .if(isOnClear) {
                    $0.modifier(SMSTextFieldClearModifier(text: $text))
                }

            if isError && !errorText.isEmpty {
                Text(errorText)
                    .padding(.leading, 8)
                    .smsFont(.caption1, color: .system(.error))
            }
        }
    }
}

struct SMSTextFieldClearModifier: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content

            if !text.isEmpty {
                Button {
                    self.text = ""
                } label: {
                    SMSIcon(.xmark)
                }
                .padding(.trailing, 12)
            }
        }
    }
}
