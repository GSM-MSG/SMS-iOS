import Foundation

public struct SMSAlertButtonType: Hashable {
    public static func == (lhs: SMSAlertButtonType, rhs: SMSAlertButtonType) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public init(
        text: String = "",
        style: CTAButton.CTAStyle = .default,
        action: @escaping () -> Void = { }
    ) {
        self.text = text
        self.style = style
        self.action = action
    }

    let id: String = UUID().uuidString
    let text: String?
    let style: CTAButton.CTAStyle?
    let action: (() -> Void)?
}
