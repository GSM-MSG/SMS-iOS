import SwiftUI

public extension CTAButton {
    enum CTAStyle {
        case outline
        case `default`
    }
}

public struct CTAButtonStyle: ButtonStyle {
    var style: CTAButton.CTAStyle

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .outline:
            OutlineButton(configuration: configuration)

        case .`default`:
            DefaultButton(configuration: configuration)
        }
    }
}

extension CTAButtonStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) var isEnabled
        var foregroundColor: Color {
            isEnabled ? .sms(.system(.white)) : .sms(.neutral(.n30))
        }
        var backgroundColor: Color {
            isEnabled ? enabledBackgroundColor : .sms(.neutral(.n20))
        }
        var enabledBackgroundColor: Color {
            configuration.isPressed ? .sms(.primary(.p3)) : .sms(.primary(.p2))
        }

        var body: some View {
            configuration.label
                .smsFont(.title2)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(8)
        }
    }
}

extension CTAButtonStyle {
    struct OutlineButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) var isEnabled
        var foregroundColor: Color {
            isEnabled ? .sms(.system(.white)) : .sms(.neutral(.n30))
        }
        var backgroundColor: Color {
            isEnabled ? enabledBackgroundColor : .sms(.neutral(.n20))
        }
        var enabledBackgroundColor: Color {
            configuration.isPressed ? .sms(.neutral(.n10)) : .sms(.system(.white))
        }
        var strokeColor: Color {
            isEnabled ? enabledStrokeColor : .clear
        }
        var enabledStrokeColor: Color {
            configuration.isPressed ? .sms(.neutral(.n20)) : .sms(.neutral(.n30))
        }

        var body: some View {
            configuration.label
                .smsFont(.title2)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(strokeColor, lineWidth: 1)
                }
        }
    }
}
