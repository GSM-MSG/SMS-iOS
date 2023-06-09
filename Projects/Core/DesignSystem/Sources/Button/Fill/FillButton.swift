import SwiftUI
import ViewUtil

public struct FillButton: View {
    var text: String
    var style: FillStyle
    var action: () -> Void

    public init(
        text: String = "",
        style: FillStyle = .default,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.action = action
    }

    public var body: some View {
        HStack {
            Spacer()

            Text(text)
                .padding(.vertical, 13.5)

            Spacer()
        }
        .buttonWrapper(action)
        .buttonStyle(FillButtonStyle(style: style))
    }
}
