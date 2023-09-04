import DesignSystem
import SwiftUI

struct ImageMethodRowView: View {
    private var title: String
    private var icon: SMSIcon.Icon
    private var action: () -> Void

    init(
        title: String,
        icon: SMSIcon.Icon,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            Label {
                SMSText(title, font: .title2)
            } icon: {
                SMSIcon(icon)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.sms(.system(.white)))
        }
    }
}
