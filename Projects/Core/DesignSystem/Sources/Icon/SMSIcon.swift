import SwiftUI

public struct SMSIcon: View {
    var icon: Icon
    var width: CGFloat
    var height: CGFloat

    public init(
        _ icon: Icon,
        width: CGFloat = 24,
        height: CGFloat = 24
    ) {
        self.icon = icon
        self.width = width
        self.height = height
    }

    public enum Icon: CaseIterable {
        case camera
        case check
        case chevronDown
        case plus
        case rightArrow
        case smallPlus
        case xmark
    }

    public var body: some View {
        iconToImage()
            .resizable()
            .frame(width: width, height: height)
    }

    private func iconToImage() -> Image {
        switch icon {
        case .camera:
            return DesignSystemAsset.Icons.camera.swiftUIImage
        case .check:
            return DesignSystemAsset.Icons.check.swiftUIImage
        case .chevronDown:
            return DesignSystemAsset.Icons.chevronDown.swiftUIImage
        case .plus:
            return DesignSystemAsset.Icons.plus.swiftUIImage
        case .rightArrow:
            return DesignSystemAsset.Icons.rightArrow.swiftUIImage
        case .smallPlus:
            return DesignSystemAsset.Icons.smallPlus.swiftUIImage
        case .xmark:
            return DesignSystemAsset.Icons.xmark.swiftUIImage
        }
    }
}
