import SwiftUI

public struct SMSDialog: View {
    var title: String
    var description: String
    var checkText: String
    var cancelText: String
    var checkAction: () -> Void
    var cancelAction: () -> Void

    public init(
        title: String,
        description: String,
        checkText: String,
        cancelText: String,
        checkAction: @escaping () -> Void = {},
        cancelAction: @escaping () -> Void = {}
    ) {
        self.title = title
        self.description = description
        self.checkText = checkText
        self.cancelText = cancelText
        self.checkAction = checkAction
        self.cancelAction = cancelAction
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .smsFont(.title2, color: .system(.black))

                Text(description)
                    .smsFont(.body1, color: .neutral(.n40))
            }
            .padding(.bottom, 36)

            HStack(spacing: 8) {
                CTAButton(text: cancelText, style: .outline, action: cancelAction)

                CTAButton(text: checkText, style: .default, action: checkAction)
            }
        }
        .padding(24)
        .background(Color.sms(.system(.white)))
        .cornerRadius(16)
    }
}
