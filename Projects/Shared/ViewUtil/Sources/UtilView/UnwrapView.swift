import SwiftUI

public struct UnwrapView<Value, Content>: View where Content: View {
    private let value: Value?
    private let content: (Value) -> Content

    public init(_ value: Value?, @ViewBuilder content: @escaping (Value) -> Content) {
        self.value = value
        self.content = content
    }

    public var body: some View {
        if let value = value {
            content(value)
        }
    }
}
