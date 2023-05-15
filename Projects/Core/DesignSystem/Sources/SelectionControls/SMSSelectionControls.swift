import SwiftUI

public struct SMSSelectionControls<T: Hashable>: View {
    @EnvironmentObject private var value: RadioValue<T>
    private var tag: T?

    public var body: some View {
        Button {
            value.selection = tag
            value.onTapReceive?(tag)
        } label: {
            ZStack {
                Circle()
                    .stroke(tag == value.selection ? Color.sms(.primary(.p2)) : Color.sms(.neutral(.n20)), lineWidth: 2)
                    .frame(width: 20, height: 20)

                Circle()
                    .fill(tag == value.selection ? Color.sms(.primary(.p2)) : .clear)
                    .frame(width: 12, height: 12)
            }
        }
        .buttonStyle(CustomButtonStyle(isOn: tag == value.selection))
    }
}

public extension SMSSelectionControls where T: Hashable {
    init(tag: T) {
        self.tag = tag
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

public struct RadioTag<T: Hashable>: ViewModifier {
    @EnvironmentObject private var value: RadioValue<T>
    private var tag: T?

    public func body(content: Content) -> some View {
        Button {
            value.selection = tag
            value.onTapReceive?(tag)
        } label: {
            content
        }
        .buttonStyle(.plain)
    }
}

public extension RadioTag where T: Hashable {
    init(_ tag: T?) {
        self.tag = tag
    }
}

extension View {
    public func radioTag<T: Hashable>(_ tag: T?) -> some View {
        self.modifier(RadioTag(tag))
    }
}

class RadioValue<T: Hashable>: ObservableObject {
    typealias TapReceiveAction = (T?) -> Void

    @Binding var selection: T?
    var onTapReceive: (TapReceiveAction)?

    init(selection: Binding<T?>, onTapReceive: (TapReceiveAction)? = nil) {
        _selection = selection
        self.onTapReceive = onTapReceive
    }
}
