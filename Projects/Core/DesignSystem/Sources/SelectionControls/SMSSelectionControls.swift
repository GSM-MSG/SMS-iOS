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
