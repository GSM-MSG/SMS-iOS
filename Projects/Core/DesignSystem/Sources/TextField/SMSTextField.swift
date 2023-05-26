import SwiftUI
import ViewUtil

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
            HStack {
                TextField(placeholder, text: $text)
                    .onSubmit(onSubmit)
                    .smsFont(.body1, color: .neutral(.n50))
                    .focused($isFocused)

                ConditionView(!text.isEmpty && isOnClear) {
                    SMSIcon(.xmark)
                        .buttonWrapper {
                            text = ""
                        }
                }
            }
            .padding(.horizontal, 12)
            .frame(height: 48)
            .background(Color.sms(.neutral(.n10)))
            .cornerRadius(8)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.sms(.primary(.p2)))
                    .conditional(isFocused)
            }
            .onTapGesture {
                isFocused = true
            }

            if isError && !errorText.isEmpty {
                Text(errorText)
                    .padding(.leading, 8)
                    .smsFont(.caption1, color: .system(.error))
            }
        }
    }
}
