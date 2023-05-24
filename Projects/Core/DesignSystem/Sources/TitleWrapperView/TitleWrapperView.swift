import SwiftUI

public struct TitleWrapperView<Content: View>: View {
    var text: String
    var position: TitlePosition
    var content: Content

    public init(
        _ text: String,
        position: TitlePosition = .top(.leading),
        @ViewBuilder content: () -> Content
    ) {
        self.text = text
        self.position = position
        self.content = content()
    }

    public var body: some View {
        content
            .titleWrapper(text, position: position)
    }
}
