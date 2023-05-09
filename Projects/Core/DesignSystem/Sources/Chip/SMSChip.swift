import SwiftUI

public struct SMSChip<Content: View>: View {
    var iconView: Content
    var text: String
    var action: () -> Void

    public init(
        text: String,
        iconView: @escaping () -> Content = {
            SMSIcon(.plus, renderingMode: .template, width: 12, height: 12)
        },
        action: @escaping () -> Void = {}
    ) {
        self.iconView = iconView()
        self.text = text
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                iconView

                Text(text)
            }
            .smsFont(.body1, color: .neutral(.n30))
        }
        .buttonStyle(SMSChipButtonStyle())
    }
}

struct SMSChip_Previews: PreviewProvider {
    static var previews: some View {
        SMSChip(text: "Text")
    }
}
