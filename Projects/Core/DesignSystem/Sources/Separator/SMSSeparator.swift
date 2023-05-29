import SwiftUI

public struct SMSSeparator: View {
    let height: CGFloat

    public init(height: CGFloat = 16) {
        self.height = height
    }

    public var body: some View {
        Rectangle()
            .fill(Color.sms(.neutral(.n10)))
            .frame(maxWidth: .infinity)
            .frame(height: height)
    }
}
