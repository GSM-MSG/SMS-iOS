import SwiftUI

public struct SMSSeparator: View {
    let color: Color
    let height: CGFloat

    public init(_ colorStyle: Color.SMSColorSystem = .neutral(.n10), height: CGFloat = 16) {
        self.color = Color.sms(colorStyle)
        self.height = height
    }

    public var body: some View {
        Rectangle()
            .fill(color)
            .frame(maxWidth: .infinity)
            .frame(height: height)
    }
}
