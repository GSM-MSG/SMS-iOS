import SwiftUI

public struct SMSText: View {
    var text: String
    var font: Font.SMSFontSystem

    public init(_ text: String, font: Font.SMSFontSystem = .body1) {
        self.text = text
        self.font = font
    }

    public var body: some View {
        Text(text)
            .smsFont(font)
    }
}
