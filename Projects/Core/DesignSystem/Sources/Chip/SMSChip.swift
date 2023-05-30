import SwiftUI
import ViewUtil

public struct SMSChip<Content: View>: View {
    var iconLabel: Content
    var text: String
    var action: () -> Void

    public init(
        _ text: String,
        action: @escaping () -> Void = {},
        iconLabel: @escaping () -> Content = {
            SMSIcon(.plus, renderingMode: .template, width: 12, height: 12)
        }
    ) {
        self.text = text
        self.iconLabel = iconLabel()
        self.action = action
    }

    public var body: some View {
        HStack(spacing: 4) {
            iconLabel

            Text(text)
        }
        .smsFont(.body1, color: .neutral(.n30))
        .buttonWrapper(action)
        .buttonStyle(SMSChipButtonStyle())
    }
}

struct SMSChip_Previews: PreviewProvider {
    static var previews: some View {
        SMSChip("Text")
    }
}
