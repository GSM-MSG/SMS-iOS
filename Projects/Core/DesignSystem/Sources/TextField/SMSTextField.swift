import SwiftUI

public struct SMSTextField: View {
    var placeholder: String
    @Binding var text: String
    var errorText: String
    var isError: Bool
    @FocusState var isFocused: Bool

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        errorText: String = "",
        isError: Bool = false
    ) {
        self.placeholder = placeholder
        _text = text
        self.errorText = errorText
        self.isError = isError
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TextField(placeholder, text: $text)
                .font(.sms(.body1))
                .foregroundColor(.sms(.neutral(.n50)))
                .padding(.horizontal, 12)
                .padding(.vertical, 13.5)
                .focused($isFocused)
                .background(Color.sms(.neutral(.n10)))
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(isFocused ? Color.sms(.primary(.p2)) : Color.white)
                }
                .modifier(SMSTextFieldClearModifier(text: $text))

            if isError && !errorText.isEmpty {
                Text(errorText)
                    .font(.sms(.caption1))
                    .foregroundColor(.sms(.system(.error)))
                    .padding(.leading, 8)
            }
        }
    }
}

struct SMSTextFieldClearModifier: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        ZStack {
            content
            if !text.isEmpty {
                HStack {
                    Spacer()
                    Button(
                        action: { self.text = "" },
                        label: {
                            SMSIcon(.xmark)
                        }
                    )
                    .padding()
                }
            }
        }
    }
}
