import SwiftUI

public struct SMSText: View {
    var text: String
    var font: Font.SMSFontSystem

    public init(text: String, font: Font.SMSFontSystem = .body1) {
        self.text = text
        self.font = font
    }

    public var body: some View {
        Text(text)
            .font(font.font)
    }
}
