import DesignSystem
import SwiftUI

struct StudentDetailSubTitleWrapper: ViewModifier {
    let title: String

    init(title: String) {
        self.title = title
    }

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .smsFont(.body1, color: .system(.black))

            content
        }
    }
}

extension View {
    func studentDetailSubTitleWrapper(title: String) -> some View {
        self.modifier(StudentDetailSubTitleWrapper(title: title))
    }
}
