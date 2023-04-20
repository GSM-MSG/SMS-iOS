import UIKit

public extension UIFont {
    // swiftlint: disable identifier_name
    enum SMSFontSystem: SMSFontable {
        case headline1
        case headline2
        case headline3
        case title1
        case title2
        case body1
        case body2
        case caption1
        case caption2
    }

    static func sms(_ style: SMSFontSystem) -> UIFont {
        return style.font
    }
}

public extension UIFont.SMSFontSystem {
    var font: UIFont {
        switch self {
        case .headline1:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 40) ?? .init()

        case .headline2:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 32) ?? .init()

        case .headline3:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 28) ?? .init()

        case .title1:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 20) ?? .init()

        case .title2:
            return UIFont(font: DesignSystemFontFamily.Pretendard.bold, size: 17) ?? .init()

        case .body1:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 15) ?? .init()

        case .body2:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 14) ?? .init()

        case .caption1:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 13) ?? .init()

        case .caption2:
            return UIFont(font: DesignSystemFontFamily.Pretendard.regular, size: 12) ?? .init()
        }
    }
}
