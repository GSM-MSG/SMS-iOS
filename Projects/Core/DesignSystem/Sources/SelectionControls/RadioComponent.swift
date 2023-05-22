import SwiftUI

public struct RadioComponent<T: Hashable, Content: View>: View {
    private let value: RadioValue<T>
    private let content: () -> Content

    public init(
        selection: Binding<T?>,
        @ViewBuilder _ content: @escaping () -> Content,
        onTapReceive: ((T?) -> Void)? = nil
    ) {
        self.value = RadioValue(selection: selection, onTapReceive: onTapReceive)
        self.content = content
    }

    public var body: some View {
        content()
            .environmentObject(value)
    }
}

final class RadioValue<T: Hashable>: ObservableObject {
    typealias TapReceiveAction = (T?) -> Void

    @Binding var selection: T?
    var onTapReceive: (TapReceiveAction)?

    init(selection: Binding<T?>, onTapReceive: (TapReceiveAction)? = nil) {
        _selection = selection
        self.onTapReceive = onTapReceive
    }
}
