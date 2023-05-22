import SwiftUI

public struct RadioTag<T: Hashable>: ViewModifier {
    @EnvironmentObject private var value: RadioValue<T>
    private var tag: T?

    init(_ tag: T?) {
        self.tag = tag
    }

    public func body(content: Content) -> some View {
        Button {
            value.selection = tag
            value.onTapReceive?(tag)
        } label: {
            content
        }
        .buttonStyle(CustomButtonStyle(isOn: tag == value.selection))
    }
}

extension View {
    public func radioTag<T: Hashable>(_ tag: T?) -> some View {
        self.modifier(RadioTag(tag))
    }
}

private struct CustomButtonStyle: ButtonStyle {
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
