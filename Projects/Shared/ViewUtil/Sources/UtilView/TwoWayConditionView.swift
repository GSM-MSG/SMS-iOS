import SwiftUI

public struct TwoWayConditionView<Content>: View where Content: View {
    private let condition: Bool
    private let trueContent: () -> Content
    private let falseContent: () -> Content

    public init(
        _ condition: Bool,
        @ViewBuilder true trueContent: @escaping () -> Content,
        @ViewBuilder false falseContent: @escaping () -> Content
    ) {
        self.condition = condition
        self.trueContent = trueContent
        self.falseContent = falseContent
    }

    public var body: some View {
        if condition {
            trueContent()
        } else {
            falseContent()
        }
    }
}
