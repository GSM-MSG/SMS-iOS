import DesignSystem
import SwiftUI

struct StudentDetailTitleWrapper: ViewModifier {
    let title: String

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .smsFont(.title2, color: .system(.black))

            content
        }
    }
}

extension View {
    func studentDetailTitleWrapper(title: String) -> some View {
        self.modifier(StudentDetailTitleWrapper(title: title))
    }
}
