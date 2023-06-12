import SwiftUI

public extension View {
    func smsFont(
        _ style: Font.SMSFontSystem,
        color: Color.SMSColorSystem
    ) -> some View {
        self
            .font(.sms(style))
            .foregroundColor(.sms(color))
    }

    func smsFont(
        _ style: Font.SMSFontSystem
    ) -> some View {
        self
            .font(.sms(style))
    }
}

public extension Font {
    enum SMSFontSystem: SMSFontable {
        case headline1
        case headline2
        case headline3
        case headline4
        case title1
        case title2
        case body1
        case body2
        case caption1
        case caption2
    }

    static func sms(_ style: SMSFontSystem) -> Font {
        return style.font
    }
}

public extension Font.SMSFontSystem {
    var font: Font {
        switch self {
        case .headline1:
            return Font(DesignSystemFontFamily.Pretendard.bold.font(size: 64))

        case .headline2:
            return Font(DesignSystemFontFamily.Pretendard.bold.font(size: 40))

        case .headline3:
            return Font(DesignSystemFontFamily.Pretendard.bold.font(size: 32))

        case .headline4:
            return Font(DesignSystemFontFamily.Pretendard.bold.font(size: 28))

        case .title1:
            return Font(DesignSystemFontFamily.Pretendard.bold.font(size: 20))

        case .title2:
            return Font(DesignSystemFontFamily.Pretendard.bold.font(size: 17))

        case .body1:
            return Font(DesignSystemFontFamily.Pretendard.regular.font(size: 15))

        case .body2:
            return Font(DesignSystemFontFamily.Pretendard.regular.font(size: 14))

        case .caption1:
            return Font(DesignSystemFontFamily.Pretendard.regular.font(size: 13))

        case .caption2:
            return Font(DesignSystemFontFamily.Pretendard.regular.font(size: 12))
        }
    }
}
