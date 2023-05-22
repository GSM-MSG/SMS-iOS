import SwiftUI

public struct SMSSelectionControls<T: Hashable>: View {
    @EnvironmentObject private var value: RadioValue<T>
    private var tag: T?

    public init(tag: T?) {
        self.tag = tag
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(tag == value.selection ? Color.sms(.primary(.p2)) : Color.sms(.neutral(.n20)), lineWidth: 2)
                .frame(width: 20, height: 20)

            Circle()
                .fill(tag == value.selection ? Color.sms(.primary(.p2)) : .clear)
                .frame(width: 12, height: 12)
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    var isOn: Bool

    init(isOn: Bool) {
        self.isOn = isOn
    }

    @ViewBuilder
    func makeBody(configuration: Configuration) -> some View {
        Circle()
            .fill(self.isOn && configuration.isPressed ? Color.sms(.neutral(.n20)) : Color.clear)
            .overlay {
                configuration.label
            }
            .frame(width: 32, height: 32)
    }
}
