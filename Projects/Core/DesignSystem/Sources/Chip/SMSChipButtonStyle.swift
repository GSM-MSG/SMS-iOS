import SwiftUI

public enum ChipStyle {
    case outline
    case `default`
}

struct SMSChipButtonStyle: ButtonStyle {
    var style: ChipStyle

    public func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .outline:
            OutlineChip(configuration: configuration)

        case .`default`:
            DefaultChip(configuration: configuration)
        }
    }
}

extension SMSChipButtonStyle {
    struct DefaultChip: View {
        let configuration: ButtonStyle.Configuration

        var body: some View {
            configuration.label
                .smsFont(.body1, color: .neutral(.n30))
                .padding(8)
                .background {
                    configuration.isPressed ? Color.sms(.neutral(.n10)) : .sms(.system(.white))
                }
                .cornerRadius(8)
        }
    }
}

extension SMSChipButtonStyle {
    struct OutlineChip: View {
        let configuration: ButtonStyle.Configuration
        var body: some View {
            configuration.label
                .padding(8)
                .smsFont(.body1, color: .system(.black))
                .background {
                    configuration.isPressed ? Color.sms(.neutral(.n20)) : .sms(.neutral(.n10))
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8).stroke(Color.sms(.system(.black)), lineWidth: 1)
                }
                .cornerRadius(8)
        }
    }
}
