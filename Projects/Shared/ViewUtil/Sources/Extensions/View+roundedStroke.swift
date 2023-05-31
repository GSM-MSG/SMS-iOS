import SwiftUI

public extension View {
    func roundedStroke(
        cornerRadius: CGFloat = 4,
        color: Color,
        lineWidth: CGFloat = 1
    ) -> some View {
        self.overlay {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(color, lineWidth: lineWidth)
        }
    }
}
