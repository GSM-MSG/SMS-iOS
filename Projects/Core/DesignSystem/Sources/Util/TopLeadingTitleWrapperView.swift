import SwiftUI

public struct TopLeadingTitleWrapperView<Content: View>: View {
    var title: String
    var content: Content

    public init(
        _ title: String,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .smsFont(.body2, color: .neutral(.n40))

            content
        }
    }
}
