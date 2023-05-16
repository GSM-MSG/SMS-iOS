import SwiftUI

public struct SMSNavigationTitleView<Content: View>: View {
    var title: String
    var content: () -> Content

    public init(
        title: String = "",
        content: @escaping () -> Content
    ) {
        self.title = title
        self.content = content
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            SMSText(title, font: .title2)
                .padding(.vertical, 13.5)

            content()
        }
    }
}
