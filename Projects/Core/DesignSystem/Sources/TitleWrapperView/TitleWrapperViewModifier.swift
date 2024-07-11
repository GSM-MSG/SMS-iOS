import SwiftUI

public struct TitleWrapperViewModifier: ViewModifier {
    var text: String
    var titlePosition: TitlePosition
    var font: Font.SMSFontSystem
    var color: Color.SMSColorSystem

    public init(
        _ text: String,
        position: TitlePosition = .top(.leading),
        font: Font.SMSFontSystem = .body2,
        color: Color.SMSColorSystem = .neutral(.n40)
    ) {
        self.text = text
        self.titlePosition = position
        self.font = font
        self.color = color
    }

    public func body(content: Content) -> some View {
        switch titlePosition {
        case let .top(alignment):
            VStack(alignment: alignment.toSUI, spacing: 8) {
                Text(text)
                    .smsFont(font, color: color)

                content
            }

        case let .bottom(alignment):
            VStack(alignment: alignment.toSUI, spacing: 8) {
                content

                Text(text)
                    .smsFont(font, color: color)
            }
        }
    }
}

public extension View {
    func titleWrapper(
        _ text: String,
        position: TitlePosition = .top(.leading),
        font: Font.SMSFontSystem = .body2,
        color: Color.SMSColorSystem = .neutral(.n40)
    ) -> some View {
        modifier(TitleWrapperViewModifier(text, position: position, font: font, color: color))
    }
}
